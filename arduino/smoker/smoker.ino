#include "arduino_secrets.h"
#include <math.h>

#define DEBUG true
#define LED D0            // Led in NodeMCU at pin GPIO16 (D0).
#define MUX_A D3
#define MUX_B D2
#define MUX_C D1



//#include <LiquidCrystal_I2C.h>

// Set the LCD address to 0x27 for a 20 chars and 4 line display
//LiquidCrystal_I2C lcd(0x27, 20, 4);

void setup() {
  pinMode(MUX_A, OUTPUT);    // multiplexer A
  pinMode(MUX_B, OUTPUT);    // mulitplexer B
  pinMode(MUX_C, OUTPUT);    // multiplexer C

  //Wire.begin();

  #ifdef DEBUG
    Serial.begin(115200);
  #endif
}

int AnalogRead(int a, int b, int c) {

  digitalWrite(MUX_A, a);
  digitalWrite(MUX_B, b);
  digitalWrite(MUX_C, c);
  
  int sample, val = 0;
  for(int i = 0; i < 20; i++) {
    sample = analogRead(A0);
    val += sample;
    
    delay(1);
  }
  val = val / 20;
  return val;
}

const double VCC = 3.3;             // NodeMCU on board 3.3v vcc
const double R2 = 100000;            // 100k ohm series resistor
const double adc_resolution = 1023; // 10-bit adc

const double A = 0.8272069482E-3;   // thermistor equation parameters
const double B = 2.087897328E-4;
const double C = 0.8062131944E-7; 
int blink = 0;
double Thermister(int adc_value) {
  double Vout, temperature;

  //Serial.print("adc_value = ");
  //Serial.print(adc_value);
  //Serial.println();
  
  double V_NTC = (adc_value * VCC) / adc_resolution;
  // V_NTC = V_NTC + .132; // calibration for sloppy input

  //Serial.print("V_NTC = ");
  //Serial.print(V_NTC);
  //Serial.println();
  
  double R_NTC = (VCC * R2 / V_NTC) - R2;
  
  //Serial.print("R_NTC = ");
  //Serial.print(R_NTC);
  //Serial.println();
  
  // probe resistance at room temp = 
  /*  Steinhart-Hart Thermistor Equation:
  *  Temperature in Kelvin = 1 / (A + B[ln(R)] + C[ln(R)]^3)
  *  where A = 0.001129148, B = 0.000234125 and C = 8.76741*10^-8  */
  temperature = (1 / (A + (B * log(R_NTC)) + (C * pow((log(R_NTC)),3))));   // Temperature in kelvin

  temperature = temperature - 273.15;  // Temperature in degree celsius
  //Serial.print("Temperature = ");
  //Serial.print(temperature);
  //Serial.println(" degree celsius");
  return (temperature*9.0/5.0)+32;
}

void loop() {  
  // Serial.print(WIFI_SSID);
  
  int adc_value = AnalogRead(LOW, LOW, LOW); // read X0
  
  double V_NTC = (adc_value * VCC) / adc_resolution;
  // V_NTC = V_NTC + .132; // calibration for sloppy input
  double R_NTC = (VCC * R2 / V_NTC) - R2;
  double t = Thermister(adc_value);
  char outBuf[20];
 
  //Serial.printf("R0: %-10.1f",R_NTC);
  //Serial.println();
  Serial.printf("T0: %-10.1fF", t);
  Serial.println();

  adc_value = AnalogRead(HIGH, LOW, LOW); // read X1
  
  V_NTC = (adc_value * VCC) / adc_resolution;
  // V_NTC = V_NTC + .132; // calibration for sloppy input
  R_NTC = (VCC * R2 / V_NTC) - R2;
  t = Thermister(adc_value);
   
  //Serial.printf("R1: %-10.1f",R_NTC);
  //Serial.println();
  Serial.printf("T1: %-10.1fF", t);
  Serial.println();
  Serial.println();
  
  // sleep 
  delay(1000);

}
