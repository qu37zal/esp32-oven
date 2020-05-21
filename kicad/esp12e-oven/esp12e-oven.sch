EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP-12E U2
U 1 1 5EB57518
P 4100 3700
F 0 "U2" H 4100 4681 50  0000 C CNN
F 1 "ESP-12E" H 4100 4590 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 4100 3700 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 3750 3800 50  0001 C CNN
	1    4100 3700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC4051 U3
U 1 1 5EB58DF7
P 6600 2950
F 0 "U3" H 6650 3631 50  0000 C CNN
F 1 "74HC4051" H 6650 3540 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6600 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc4051.pdf" H 6600 2550 50  0001 C CNN
	1    6600 2950
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM1117-3.3 U1
U 1 1 5EB5A5BF
P 1550 1200
F 0 "U1" H 1550 1442 50  0000 C CNN
F 1 "LM1117-3.3" H 1550 1351 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 1550 1200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 1550 1200 50  0001 C CNN
	1    1550 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5EB66009
P 2750 1650
F 0 "C1" H 2865 1696 50  0000 L CNN
F 1 "470uF" H 2865 1605 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P1.50mm" H 2788 1500 50  0001 C CNN
F 3 "~" H 2750 1650 50  0001 C CNN
	1    2750 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EB66AF0
P 3350 1650
F 0 "R2" H 3420 1696 50  0000 L CNN
F 1 "4.7k" H 3420 1605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3280 1650 50  0001 C CNN
F 3 "~" H 3350 1650 50  0001 C CNN
	1    3350 1650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5EB682FC
P 2250 3100
F 0 "SW1" H 2250 3335 50  0000 C CNN
F 1 "SW_SPST" H 2250 3244 50  0000 C CNN
F 2 "Button_Switch_THT:KSA_Tactile_SPST" H 2250 3100 50  0001 C CNN
F 3 "~" H 2250 3100 50  0001 C CNN
	1    2250 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5EB6A800
P 6150 2150
F 0 "C3" V 5898 2150 50  0000 C CNN
F 1 "0.1uF" V 5989 2150 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P1.50mm" H 6188 2000 50  0001 C CNN
F 3 "~" H 6150 2150 50  0001 C CNN
	1    6150 2150
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5EB72B39
P 850 1050
F 0 "#PWR01" H 850 900 50  0001 C CNN
F 1 "VCC" H 867 1223 50  0000 C CNN
F 2 "" H 850 1050 50  0001 C CNN
F 3 "" H 850 1050 50  0001 C CNN
	1    850  1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5EB746C9
P 850 4850
F 0 "#PWR02" H 850 4600 50  0001 C CNN
F 1 "GND" H 855 4677 50  0000 C CNN
F 2 "" H 850 4850 50  0001 C CNN
F 3 "" H 850 4850 50  0001 C CNN
	1    850  4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1050 850  1200
Wire Wire Line
	850  1200 1250 1200
Wire Wire Line
	6600 1200 6600 2000
Wire Wire Line
	1850 1200 2750 1200
Wire Wire Line
	900  4850 1550 4850
Wire Wire Line
	4100 4400 4100 4850
Connection ~ 4100 4850
Wire Wire Line
	4100 4850 5150 4850
Wire Wire Line
	5150 3700 5150 4850
Connection ~ 5150 4850
Wire Wire Line
	5150 4850 5400 4850
Wire Wire Line
	4100 2900 5150 2900
Wire Wire Line
	4100 2900 4100 1200
Connection ~ 4100 2900
Connection ~ 4100 1200
Wire Wire Line
	4100 1200 6600 1200
Wire Wire Line
	5800 3700 5800 2850
Wire Wire Line
	5800 2850 6300 2850
Wire Wire Line
	4700 3800 5900 3800
Wire Wire Line
	5900 3800 5900 2950
Wire Wire Line
	5900 2950 6300 2950
Wire Wire Line
	4700 3900 6000 3900
Wire Wire Line
	6000 3900 6000 3050
Wire Wire Line
	6000 3050 6300 3050
Wire Wire Line
	5150 2900 5150 3400
$Comp
L Device:C C2
U 1 1 5EB6BDE2
P 5150 3550
F 0 "C2" V 4898 3550 50  0000 C CNN
F 1 "0.1uF" V 4989 3550 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P1.50mm" H 5188 3400 50  0001 C CNN
F 3 "~" H 5150 3550 50  0001 C CNN
	1    5150 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4700 3700 5800 3700
Wire Wire Line
	6150 2000 6600 2000
Connection ~ 6600 2000
Wire Wire Line
	6600 2000 6600 2450
Wire Wire Line
	6150 2300 6150 3250
Wire Wire Line
	6150 3550 6600 3550
Wire Wire Line
	6150 3550 6150 3650
Connection ~ 6150 3550
Connection ~ 6150 4850
Wire Wire Line
	6300 3250 6150 3250
Connection ~ 6150 3250
Wire Wire Line
	6150 3250 6150 3550
Wire Wire Line
	6700 3550 6700 3650
Wire Wire Line
	6700 3650 6150 3650
Connection ~ 6150 3650
Wire Wire Line
	3500 3500 3100 3500
Wire Wire Line
	3100 3500 3100 2650
Wire Wire Line
	3100 2650 6300 2650
Wire Wire Line
	1550 1500 1550 2050
Connection ~ 1550 4850
Wire Wire Line
	1550 4850 3100 4850
Wire Wire Line
	2050 3100 1550 3100
Connection ~ 1550 3100
Wire Wire Line
	1550 3100 1550 4850
Wire Wire Line
	2450 3100 2750 3100
Wire Wire Line
	2750 3100 2750 1800
Wire Wire Line
	2750 1500 2750 1200
Connection ~ 2750 1200
Wire Wire Line
	2750 1200 3350 1200
Wire Wire Line
	2750 3100 3350 3100
Connection ~ 2750 3100
Wire Wire Line
	3350 3100 3350 1800
Connection ~ 3350 3100
Wire Wire Line
	3350 3100 3500 3100
Wire Wire Line
	3350 1500 3350 1200
Connection ~ 3350 1200
Wire Wire Line
	3350 1200 4100 1200
NoConn ~ 3500 3300
NoConn ~ 3500 3700
NoConn ~ 3500 3800
NoConn ~ 3500 3900
NoConn ~ 3500 4000
NoConn ~ 3500 4100
NoConn ~ 3500 4200
NoConn ~ 4700 3200
NoConn ~ 4700 3300
NoConn ~ 4700 3400
NoConn ~ 4700 3600
Wire Wire Line
	6150 3650 6150 4850
Wire Wire Line
	7100 1200 7100 2650
Wire Wire Line
	7100 2650 7000 2650
Wire Wire Line
	7200 2750 7000 2750
Wire Wire Line
	7300 2850 7000 2850
Wire Wire Line
	7400 2950 7000 2950
Connection ~ 8400 1650
Wire Wire Line
	8400 1850 8650 1850
Wire Wire Line
	8400 1650 8400 1850
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5EBD2D0B
P 7500 1000
F 0 "J3" V 7464 812 50  0000 R CNN
F 1 "Conn_01x02" V 7373 812 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 7500 1000 50  0001 C CNN
F 3 "~" H 7500 1000 50  0001 C CNN
	1    7500 1000
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5EBD44E0
P 7500 1450
F 0 "J4" V 7464 1262 50  0000 R CNN
F 1 "Conn_01x02" V 7373 1262 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 7500 1450 50  0001 C CNN
F 3 "~" H 7500 1450 50  0001 C CNN
	1    7500 1450
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 5EBD4A45
P 7500 1900
F 0 "J5" V 7464 1712 50  0000 R CNN
F 1 "Conn_01x02" V 7373 1712 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 7500 1900 50  0001 C CNN
F 3 "~" H 7500 1900 50  0001 C CNN
	1    7500 1900
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 5EBD5059
P 7500 2350
F 0 "J6" V 7464 2162 50  0000 R CNN
F 1 "Conn_01x02" V 7373 2162 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 7500 2350 50  0001 C CNN
F 3 "~" H 7500 2350 50  0001 C CNN
	1    7500 2350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 1200 8400 1200
Wire Wire Line
	8400 1200 8400 1650
Wire Wire Line
	7600 1650 8400 1650
Wire Wire Line
	7600 2100 8400 2100
Connection ~ 8400 2100
Wire Wire Line
	8400 2100 8400 2550
Wire Wire Line
	7600 2550 8400 2550
Wire Wire Line
	7500 1200 7100 1200
Wire Wire Line
	7500 1650 7200 1650
Wire Wire Line
	7200 1650 7200 2750
Wire Wire Line
	7500 2100 7300 2100
Wire Wire Line
	7300 2100 7300 2850
Wire Wire Line
	7500 2550 7400 2550
Wire Wire Line
	7400 2550 7400 2950
Connection ~ 8400 1850
Wire Wire Line
	8400 1850 8400 2100
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5EB5C7DD
P 8850 4100
F 0 "J7" H 8930 4092 50  0000 L CNN
F 1 "Conn_01x03" H 8930 4001 50  0000 L CNN
F 2 "Connector_PinSocket_2.00mm:PinSocket_1x03_P2.00mm_Horizontal" H 8850 4100 50  0001 C CNN
F 3 "~" H 8850 4100 50  0001 C CNN
	1    8850 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EC69EDE
P 3100 4100
F 0 "R1" H 3170 4146 50  0000 L CNN
F 1 "100K" H 3170 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3030 4100 50  0001 C CNN
F 3 "~" H 3100 4100 50  0001 C CNN
	1    3100 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3950 3100 3500
Connection ~ 3100 3500
Wire Wire Line
	3100 4250 3100 4850
Connection ~ 3100 4850
Wire Wire Line
	3100 4850 4100 4850
Wire Wire Line
	8650 1850 8650 800 
Wire Wire Line
	8650 800  6600 800 
Wire Wire Line
	6600 800  6600 1200
Connection ~ 6600 1200
Wire Wire Line
	8650 4100 4700 4100
Wire Wire Line
	8650 1850 8650 3800
Connection ~ 8650 1850
Wire Wire Line
	8650 4850 8650 4200
Wire Wire Line
	6150 4850 8650 4850
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 5ECA3B74
P 9050 2250
F 0 "J8" V 9014 2062 50  0000 R CNN
F 1 "Conn_01x02" V 8923 2062 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 9050 2250 50  0001 C CNN
F 3 "~" H 9050 2250 50  0001 C CNN
	1    9050 2250
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 5ECA4D62
P 9050 2650
F 0 "J9" V 9014 2462 50  0000 R CNN
F 1 "Conn_01x02" V 8923 2462 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 9050 2650 50  0001 C CNN
F 3 "~" H 9050 2650 50  0001 C CNN
	1    9050 2650
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 5ECA573F
P 9050 3050
F 0 "J10" V 9014 2862 50  0000 R CNN
F 1 "Conn_01x02" V 8923 2862 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 9050 3050 50  0001 C CNN
F 3 "~" H 9050 3050 50  0001 C CNN
	1    9050 3050
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J11
U 1 1 5ECA6122
P 9050 3400
F 0 "J11" V 9014 3212 50  0000 R CNN
F 1 "Conn_01x02" V 8923 3212 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 9050 3400 50  0001 C CNN
F 3 "~" H 9050 3400 50  0001 C CNN
	1    9050 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9150 2450 9900 2450
Wire Wire Line
	9900 2450 9900 1850
Wire Wire Line
	9900 1850 8650 1850
Wire Wire Line
	9900 2450 9900 2850
Wire Wire Line
	9900 3600 9150 3600
Connection ~ 9900 2450
Wire Wire Line
	9150 3250 9900 3250
Connection ~ 9900 3250
Wire Wire Line
	9900 3250 9900 3600
Wire Wire Line
	9150 2850 9900 2850
Connection ~ 9900 2850
Wire Wire Line
	9900 2850 9900 3250
Wire Wire Line
	9050 2450 8550 2450
Wire Wire Line
	8550 2450 8550 3050
Wire Wire Line
	8550 3050 7000 3050
Wire Wire Line
	9050 2850 8600 2850
Wire Wire Line
	8600 2850 8600 3150
Wire Wire Line
	8600 3150 7000 3150
Wire Wire Line
	9050 3250 7000 3250
Wire Wire Line
	9050 3600 8600 3600
Wire Wire Line
	8600 3600 8600 3350
Wire Wire Line
	8600 3350 7000 3350
$Comp
L Connector_Generic:Conn_01x03 J12
U 1 1 5ECCCE14
P 9650 4600
F 0 "J12" H 9730 4592 50  0000 L CNN
F 1 "Conn_01x03" H 9730 4501 50  0000 L CNN
F 2 "Connector_PinSocket_2.00mm:PinSocket_1x03_P2.00mm_Horizontal" H 9650 4600 50  0001 C CNN
F 3 "~" H 9650 4600 50  0001 C CNN
	1    9650 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4500 9450 3800
Wire Wire Line
	9450 3800 8650 3800
Connection ~ 8650 3800
Wire Wire Line
	8650 3800 8650 4000
Wire Wire Line
	9450 4700 9450 4850
Wire Wire Line
	9450 4850 8650 4850
Connection ~ 8650 4850
Wire Wire Line
	9450 4600 5000 4600
Wire Wire Line
	5000 4600 5000 4000
Wire Wire Line
	5000 4000 4700 4000
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5ECD86F3
P 5600 5450
F 0 "J2" V 5564 5262 50  0000 R CNN
F 1 "Conn_01x04" V 5473 5262 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x04_P2.00mm_Vertical" H 5600 5450 50  0001 C CNN
F 3 "~" H 5600 5450 50  0001 C CNN
	1    5600 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 3500 5700 3500
Wire Wire Line
	5700 3500 5700 5250
Wire Wire Line
	4700 3100 5600 3100
Wire Wire Line
	5600 3100 5600 5250
Wire Wire Line
	5400 5250 5400 4850
Connection ~ 5400 4850
Wire Wire Line
	5400 4850 6150 4850
Wire Wire Line
	9900 3600 9900 5100
Wire Wire Line
	9900 5100 5500 5100
Wire Wire Line
	5500 5100 5500 5250
Connection ~ 9900 3600
$Comp
L Connector:Barrel_Jack_MountingPin J1
U 1 1 5ED2AD57
P 950 1950
F 0 "J1" H 1007 2267 50  0000 C CNN
F 1 "Barrel_Jack_MountingPin" H 1007 2176 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 1000 1910 50  0001 C CNN
F 3 "~" H 1000 1910 50  0001 C CNN
	1    950  1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1850 1250 1200
Connection ~ 1250 1200
Wire Wire Line
	1250 2050 1550 2050
Connection ~ 1550 2050
Wire Wire Line
	1550 2050 1550 3100
$Comp
L Mechanical:MountingHole H1
U 1 1 5EC76A18
P 1100 5400
F 0 "H1" H 1200 5446 50  0000 L CNN
F 1 "MountingHole" H 1200 5355 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 1100 5400 50  0001 C CNN
F 3 "~" H 1100 5400 50  0001 C CNN
	1    1100 5400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5EC76DF3
P 1100 5600
F 0 "H2" H 1200 5646 50  0000 L CNN
F 1 "MountingHole" H 1200 5555 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 1100 5600 50  0001 C CNN
F 3 "~" H 1100 5600 50  0001 C CNN
	1    1100 5600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5EC7729F
P 1100 5800
F 0 "H3" H 1200 5846 50  0000 L CNN
F 1 "MountingHole" H 1200 5755 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 1100 5800 50  0001 C CNN
F 3 "~" H 1100 5800 50  0001 C CNN
	1    1100 5800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5EC7767F
P 1100 6000
F 0 "H4" H 1200 6046 50  0000 L CNN
F 1 "MountingHole" H 1200 5955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 1100 6000 50  0001 C CNN
F 3 "~" H 1100 6000 50  0001 C CNN
	1    1100 6000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
