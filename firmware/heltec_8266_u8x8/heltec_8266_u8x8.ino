#include <U8g2lib.h>
#include <math.h>

//U8g2 Contructor
// U8G2_SSD1306_128X32_UNIVISION_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ 16, /* clock=*/ 5, /* data=*/ 4);
// U8X8_SSD1306_128X32_UNIVISION_HW_I2C([reset [, clock, data]])
U8X8_SSD1306_128X32_UNIVISION_HW_I2C u8x8(16,5,4);

// Alternative board version. Uncomment if above doesn't work.
// U8G2_SSD1306_128X32_UNIVISION_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ 4, /* clock=*/ 14, /* data=*/ 2);

u8g2_uint_t offset;     // current offset for the scrolling text
u8g2_uint_t width;      // pixel width of the scrolling text (must be lesser than 128 unless U8G2_16BIT is defined




/*
 *  Download library: https://github.com/fdebrabander/Arduino-LiquidCrystal-I2C-library
 *  
 *  Updated by Ahmad Shamshiri on July 08, 2018 at 19:14 in Ajax, Ontario, Canada
 * for Robojax.com
 * Get this code from Robojax.com
 * Watch video instruction for this code at:https://youtu.be/DKmNSCMPDjE
 * 
 */
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

// Set the LCD address to 0x27 for a 20 chars and 4 line display
LiquidCrystal_I2C lcd(0x27, 20, 4);

void setup(void) {
  u8x8.begin();
  Serial.begin(9600);
  Wire.begin();
  
  Serial.println("\nThermal Controller");
  // initialize the offboard LCD
  lcd.begin();

  // Turn on the blacklight and print a message.
  // The begin call takes the width and height. This
  // Should match the number provided to the constructor.

  //Serial.println("\n\nInitializing output...");
  pinMode(D6, OUTPUT);
  pinMode(D3, OUTPUT);
  digitalWrite(D6, LOW);
  //Serial.println("Done.");
  
  // Turn on the backlight.
  lcd.backlight();

  // Move the cursor characters to the right and
  // zero characters down (line 1).
  
  
  // Move the cursor to the next line and print
  // WORLD.
  // Print HELLO to the screen, starting at 5,0.
  lcd.setCursor(0, 0);
  lcd.print("Jeremy==Beast");
  lcd.setCursor(0, 1);      
  lcd.print("Liam!=Tails.exe");
  lcd.setCursor(0, 2);      
  lcd.print("01234567890123456789");
  lcd.setCursor(0, 3);      
  lcd.print("01234567890123456789");
  
}


int AnalogRead() {
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
const double R2 = 85000;            // 100k ohm series resistor
const double adc_resolution = 1023; // 10-bit adc

const double A = 1.675029124E-3;   // thermistor equation parameters
const double B = 1.000079130E-4;
const double C = 3.473082928E-7; 
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
  //
     
  return (temperature*9.0/5.0)+32;

}

void loop(void) {
  u8x8.setFont(u8x8_font_8x13_1x2_r); 
  char outBuf[20];
  // Serial.println(R_NTC);
  int adc_value = AnalogRead();
  double V_NTC = (adc_value * VCC) / adc_resolution;
  // V_NTC = V_NTC + .132; // calibration for sloppy input
  double R_NTC = (VCC * R2 / V_NTC) - R2;
  double t = Thermister(adc_value);
  // u8x8.clear();
  sprintf(outBuf,"Rt: %-10.2f",R_NTC);
  u8x8.drawString(0,0, outBuf);
  sprintf(outBuf,"T1: %-10.2fF", t);
  u8x8.drawString(0,2, outBuf);

  if(t<212.0) // boil water
  {
    blink = 1;
    digitalWrite(D6, HIGH);
  } else 
  {
    blink = 0;
    digitalWrite(D6, LOW);
  }
  // sleep 
  delay(1000);


  /*  // i2c scanner
  byte error, address;
  int nDevices;
  Serial.println("Scanning...");
  nDevices = 0;
  for(address = 1; address < 127; address++ ) {
    Wire.beginTransmission(address);
    error = Wire.endTransmission();
    if (error == 0) {
      Serial.print("I2C device found at address 0x");
      if (address<16) {
        Serial.print("0");
      }
      Serial.println(address,HEX);
      nDevices++;
    }
    else if (error==4) {
      Serial.print("Unknow error at address 0x");
      if (address<16) {
        Serial.print("0");
      }
      Serial.println(address,HEX);
    }    
  }
  if (nDevices == 0) {
    Serial.println("No I2C devices found\n");
  }
  else {
    Serial.println("done\n");
  }
  delay(5000); 
  */
}
