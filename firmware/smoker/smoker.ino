#include "arduino_secrets.h"
#include <Arduino_JSON.h>
#include <math.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

#define DEBUG true
#define LED D0            // Led in NodeMCU at pin GPIO16 (D0).
#define MUX_A D3
#define MUX_B D2
#define MUX_C D1

const char* ssid = "AIONEX-2.4";
const char* password = "aionex2017";

const char* serverName = "http://10.1.10.166:8080/update";


#include <LiquidCrystal_I2C.h>
// Set the LCD address to 0x27 for a 20 chars and 4 line display
LiquidCrystal_I2C lcd(0x27, 20, 4);

void setup() {
  pinMode(MUX_A, OUTPUT);    // multiplexer A
  pinMode(MUX_B, OUTPUT);    // mulitplexer B
  pinMode(MUX_C, OUTPUT);    // multiplexer C

  #ifdef DEBUG
    Serial.begin(115200);
  #endif

  WiFi.begin(ssid, password);
  Serial.println();
  Serial.println("Connecting");
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");
  Serial.println(WiFi.localIP());
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
  char outBuf[20];
  char jsonBuf[1024];
  int adc_value;
  double rt_value[8];
  
  // Serial.print(WIFI_SSID);
  
  adc_value = AnalogRead(LOW, LOW, LOW); // read X0
  rt_value[0] = Thermister(adc_value);
  adc_value = AnalogRead(HIGH, LOW, LOW); // read X1
  rt_value[1] = Thermister(adc_value);
  adc_value = AnalogRead(LOW, HIGH, LOW); // read X2
  rt_value[2] = Thermister(adc_value);
  adc_value = AnalogRead(HIGH, HIGH, LOW); // read X3
  rt_value[3] = Thermister(adc_value);
  adc_value = AnalogRead(LOW, LOW, HIGH); // read X4
  rt_value[4] = Thermister(adc_value);
  adc_value = AnalogRead(HIGH, LOW, HIGH); // read X5
  rt_value[5] = Thermister(adc_value);
  adc_value = AnalogRead(LOW, HIGH, HIGH); // read X6
  rt_value[6] = Thermister(adc_value);
  adc_value = AnalogRead(HIGH, HIGH, HIGH); // read X7
  rt_value[7] = Thermister(adc_value);

  // create JSON packet
  sprintf(jsonBuf,"{\"api_key\":\"tPmAT5Ab3j7F9\",\"t0\":%f,\"t1\":%f,\"t2\":%f,\"t3\":%f,\"t4\":%f,\"t5\":%f,\"t6\":%f,\"t7\":%f}",
  rt_value[0],
  rt_value[1],
  rt_value[2],
  rt_value[3],
  rt_value[4],
  rt_value[5],
  rt_value[6],
  rt_value[7]);
  
  Serial.printf("%s",jsonBuf);
  Serial.println();

  if(WiFi.status()== WL_CONNECTED) {
    HTTPClient http;
    // Your Domain name with URL path or IP address with path
    http.begin(serverName);

    // If you need an HTTP request with a content type: application/json, use the following:
    http.addHeader("Content-Type", "application/json");
    int httpResponseCode = http.POST(jsonBuf);
   
    Serial.print("HTTP Response code: ");
    Serial.println(httpResponseCode);
    http.end();
  }
      
  // sleep 
  delay(60000);

}
