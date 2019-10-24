EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:esquematico-cache
EELAYER 25 0
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
L ATMEGA328P-PU Microcontrolador
U 1 1 5A10B032
P 2950 2050
F 0 "Microcontrolador" H 2200 3300 50  0000 L BNN
F 1 "ATMEGA328P-PU" H 3350 650 50  0000 L BNN
F 2 "DIL28" H 2950 2050 50  0001 C CIN
F 3 "" H 2950 2050 50  0001 C CNN
	1    2950 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A10B3F2
P 1700 3400
F 0 "#PWR?" H 1700 3150 50  0001 C CNN
F 1 "GND" H 1700 3250 50  0000 C CNN
F 2 "" H 1700 3400 50  0001 C CNN
F 3 "" H 1700 3400 50  0001 C CNN
	1    1700 3400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5A10B4EA
P 1700 1150
F 0 "#PWR?" H 1700 1000 50  0001 C CNN
F 1 "+5V" H 1700 1290 50  0000 C CNN
F 2 "" H 1700 1150 50  0001 C CNN
F 3 "" H 1700 1150 50  0001 C CNN
	1    1700 1150
	1    0    0    -1  
$EndComp
$Comp
L C C
U 1 1 5A10B521
P 1700 1950
F 0 "C" H 1725 2050 50  0000 L CNN
F 1 "100 nF" H 1725 1850 50  0000 L CNN
F 2 "" H 1738 1800 50  0001 C CNN
F 3 "" H 1700 1950 50  0001 C CNN
	1    1700 1950
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW?
U 1 1 5A119BFD
P 2200 4750
F 0 "SW?" H 2250 4850 50  0001 L CNN
F 1 "SW_Push" H 2200 4690 50  0000 C CNN
F 2 "" H 2200 4950 50  0001 C CNN
F 3 "" H 2200 4950 50  0001 C CNN
	1    2200 4750
	1    0    0    -1  
$EndComp
Text Label 4000 2400 0    60   ~ 0
RESET
Text Label 2600 4750 0    60   ~ 0
RESET
$Comp
L C 100n
U 1 1 5A119D2D
P 2450 5100
F 0 "100n" H 2475 5200 50  0000 L CNN
F 1 "C" H 2475 5000 50  0000 L CNN
F 2 "" H 2488 4950 50  0001 C CNN
F 3 "" H 2450 5100 50  0001 C CNN
	1    2450 5100
	1    0    0    -1  
$EndComp
$Comp
L R 100k
U 1 1 5A119D89
P 2450 4300
F 0 "100k" V 2530 4300 50  0000 C CNN
F 1 "R" V 2450 4300 50  0000 C CNN
F 2 "" V 2380 4300 50  0001 C CNN
F 3 "" H 2450 4300 50  0001 C CNN
	1    2450 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A119DCE
P 2200 5400
F 0 "#PWR?" H 2200 5150 50  0001 C CNN
F 1 "GND" H 2200 5250 50  0000 C CNN
F 2 "" H 2200 5400 50  0001 C CNN
F 3 "" H 2200 5400 50  0001 C CNN
	1    2200 5400
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5A119DEE
P 2450 4150
F 0 "#PWR?" H 2450 4000 50  0001 C CNN
F 1 "VCC" H 2450 4300 50  0000 C CNN
F 2 "" H 2450 4150 50  0001 C CNN
F 3 "" H 2450 4150 50  0001 C CNN
	1    2450 4150
	1    0    0    -1  
$EndComp
$Comp
L IRarduino IR1
U 1 1 5A11BFBF
P 5450 2700
F 0 "IR1" H 5600 3850 60  0001 C CNN
F 1 "Comparador IR i-esimo" V 5500 4050 60  0000 C CNN
F 2 "IR1" H 5600 3850 60  0001 C CNN
F 3 "" H 5600 3850 60  0001 C CNN
	1    5450 2700
	1    0    0    -1  
$EndComp
$Comp
L IR204A D?
U 1 1 5A11C3E2
P 6400 1050
F 0 "D?" H 6420 1120 50  0001 L CNN
F 1 "IR204A" H 6360 940 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 6400 1225 50  0001 C CNN
F 3 "" H 6350 1050 50  0001 C CNN
	1    6400 1050
	-1   0    0    -1  
$EndComp
$Comp
L D_Photo D?
U 1 1 5A11C45F
P 6400 1750
F 0 "D?" H 6420 1820 50  0001 L CNN
F 1 "D_Photo" H 6360 1640 50  0000 C CNN
F 2 "" H 6350 1750 50  0001 C CNN
F 3 "" H 6350 1750 50  0001 C CNN
	1    6400 1750
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A11C54A
P 5550 2350
F 0 "#PWR?" H 5550 2100 50  0001 C CNN
F 1 "GND" H 5550 2200 50  0000 C CNN
F 2 "" H 5550 2350 50  0001 C CNN
F 3 "" H 5550 2350 50  0001 C CNN
	1    5550 2350
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5A11C7D0
P 4900 1400
F 0 "#PWR?" H 4900 1250 50  0001 C CNN
F 1 "VCC" H 4900 1550 50  0000 C CNN
F 2 "" H 4900 1400 50  0001 C CNN
F 3 "" H 4900 1400 50  0001 C CNN
	1    4900 1400
	1    0    0    -1  
$EndComp
Text Label 4900 1100 0    60   ~ 0
IR-i
Text Label 4000 2750 0    60   ~ 0
IR-1
Text Label 4000 2850 0    60   ~ 0
IR-2
Text Label 4000 1250 0    60   ~ 0
PROGRAMADOR
Text Label 4000 1350 0    60   ~ 0
PROGRAMADOR
Text Notes 2200 3800 0    60   ~ 0
Los pines sin usar deben ir a GND\npara evitar valores indefinidos.\n
Wire Wire Line
	1700 1150 1700 1250
Wire Wire Line
	1700 1250 2050 1250
Wire Wire Line
	1700 2100 1700 3400
Wire Wire Line
	1700 3250 2050 3250
Wire Wire Line
	1950 3250 1950 3150
Wire Wire Line
	1950 3150 2050 3150
Connection ~ 1950 3250
Wire Wire Line
	1950 1250 1950 950 
Wire Wire Line
	1950 950  2050 950 
Connection ~ 1950 1250
Connection ~ 1700 3250
Wire Wire Line
	1700 1800 1700 1550
Wire Wire Line
	1700 1550 2050 1550
Wire Wire Line
	3950 2400 4250 2400
Wire Wire Line
	2600 4750 2400 4750
Wire Wire Line
	2450 4450 2450 4950
Connection ~ 2450 4750
Wire Wire Line
	2000 4750 2000 5250
Wire Wire Line
	2000 5250 2450 5250
Wire Wire Line
	2200 5400 2200 5250
Connection ~ 2200 5250
Wire Wire Line
	4900 1700 4900 2350
Wire Wire Line
	4900 2350 6600 2350
Wire Wire Line
	6600 2350 6600 1050
Connection ~ 5550 2350
Wire Wire Line
	3950 2750 4250 2750
Wire Wire Line
	3950 2850 4250 2850
Wire Wire Line
	3950 1350 4250 1350
Wire Wire Line
	3950 1250 4250 1250
Wire Wire Line
	3950 2550 4750 2550
Wire Wire Line
	3950 2650 4650 2650
Wire Wire Line
	3950 3050 4250 3050
Wire Wire Line
	3950 3150 4250 3150
Wire Wire Line
	3950 3250 4250 3250
Wire Wire Line
	3950 1650 4250 1650
Wire Wire Line
	3950 1800 4250 1800
Wire Wire Line
	3950 1900 4250 1900
Wire Wire Line
	3950 2000 4250 2000
Wire Wire Line
	3950 2100 4250 2100
Wire Wire Line
	3950 2200 4250 2200
Text Label 4000 1650 0    60   ~ 0
CLK-Local
Text Label 4000 3050 0    60   ~ 0
DIO-Local
Text Label 4000 3150 0    60   ~ 0
CLK-Tiempo
Text Label 4000 3250 0    60   ~ 0
DIO-Tiempo
Text Label 4000 2200 0    60   ~ 0
LED1
Text Label 4000 2100 0    60   ~ 0
LED2
Text Label 4000 2000 0    60   ~ 0
CLK-Visitante
Text Label 4000 1900 0    60   ~ 0
Buzzer
Text Label 4000 1800 0    60   ~ 0
DIO-Visitante
Text Label 4000 2550 0    60   ~ 0
PC-RX
Text Label 4000 2650 0    60   ~ 0
PC-TX
$Comp
L Buzzer asd
U 1 1 5A11D76A
P 1850 4200
F 0 "asd" H 2000 4250 50  0001 L CNN
F 1 "Buzzer" H 2000 4150 50  0000 L CNN
F 2 "" V 1825 4300 50  0001 C CNN
F 3 "" V 1825 4300 50  0001 C CNN
	1    1850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4100 1750 4100
$Comp
L GND #PWR?
U 1 1 5A11D7D7
P 1750 4300
F 0 "#PWR?" H 1750 4050 50  0001 C CNN
F 1 "GND" H 1750 4150 50  0000 C CNN
F 2 "" H 1750 4300 50  0001 C CNN
F 3 "" H 1750 4300 50  0001 C CNN
	1    1750 4300
	1    0    0    -1  
$EndComp
Text Label 1450 4100 0    60   ~ 0
Buzzer
$Comp
L DISPLAY_TM1637 tm1637?
U 1 1 5A11E5DE
P 3400 4850
F 0 "tm1637?" H 2750 5050 60  0001 C CNN
F 1 "DISPLAY_TM1637" H 2750 5050 20  0001 C CNN
F 2 "" H 2750 5050 60  0001 C CNN
F 3 "" H 2750 5050 60  0001 C CNN
	1    3400 4850
	1    0    0    -1  
$EndComp
$Comp
L DISPLAY_TM1637 tm1637?
U 1 1 5A11E6C2
P 4400 4850
F 0 "tm1637?" H 3750 5050 60  0001 C CNN
F 1 "DISPLAY_TM1637" H 3750 5050 20  0001 C CNN
F 2 "" H 3750 5050 60  0001 C CNN
F 3 "" H 3750 5050 60  0001 C CNN
	1    4400 4850
	1    0    0    -1  
$EndComp
$Comp
L DISPLAY_TM1637 tm1637?
U 1 1 5A11E6DE
P 5400 4850
F 0 "tm1637?" H 4750 5050 60  0001 C CNN
F 1 "DISPLAY_TM1637" H 4750 5050 20  0001 C CNN
F 2 "" H 4750 5050 60  0001 C CNN
F 3 "" H 4750 5050 60  0001 C CNN
	1    5400 4850
	1    0    0    -1  
$EndComp
Text Notes 3200 4000 0    60   ~ 0
Display Local\n
Text Notes 4150 4000 0    60   ~ 0
Display Tiempo\n
Text Notes 5100 4000 0    60   ~ 0
Display Visitante\n
Text Label 3100 5300 1    60   ~ 0
DIO-Local
Text Label 3250 5300 1    60   ~ 0
CLK-Local
Text Label 4100 5400 1    60   ~ 0
DIO-Tiempo
Text Label 4250 5400 1    60   ~ 0
CLK-Tiempo
Text Label 5100 5450 1    60   ~ 0
DIO-Visitante
Text Label 5250 5450 1    60   ~ 0
CLK-Visitante
$Comp
L GND #PWR?
U 1 1 5A11E7F0
P 5600 5000
F 0 "#PWR?" H 5600 4750 50  0001 C CNN
F 1 "GND" H 5600 4850 50  0000 C CNN
F 2 "" H 5600 5000 50  0001 C CNN
F 3 "" H 5600 5000 50  0001 C CNN
	1    5600 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A11E80C
P 4600 5000
F 0 "#PWR?" H 4600 4750 50  0001 C CNN
F 1 "GND" H 4600 4850 50  0000 C CNN
F 2 "" H 4600 5000 50  0001 C CNN
F 3 "" H 4600 5000 50  0001 C CNN
	1    4600 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A11E828
P 3600 5000
F 0 "#PWR?" H 3600 4750 50  0001 C CNN
F 1 "GND" H 3600 4850 50  0000 C CNN
F 2 "" H 3600 5000 50  0001 C CNN
F 3 "" H 3600 5000 50  0001 C CNN
	1    3600 5000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5A11E844
P 3450 5000
F 0 "#PWR?" H 3450 4850 50  0001 C CNN
F 1 "VCC" H 3450 5150 50  0000 C CNN
F 2 "" H 3450 5000 50  0001 C CNN
F 3 "" H 3450 5000 50  0001 C CNN
	1    3450 5000
	1    0    0    1   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5A11E860
P 4450 5000
F 0 "#PWR?" H 4450 4850 50  0001 C CNN
F 1 "VCC" H 4450 5150 50  0000 C CNN
F 2 "" H 4450 5000 50  0001 C CNN
F 3 "" H 4450 5000 50  0001 C CNN
	1    4450 5000
	1    0    0    1   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5A11E87C
P 5450 5000
F 0 "#PWR?" H 5450 4850 50  0001 C CNN
F 1 "VCC" H 5450 5150 50  0000 C CNN
F 2 "" H 5450 5000 50  0001 C CNN
F 3 "" H 5450 5000 50  0001 C CNN
	1    5450 5000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 5000 3300 5300
Wire Wire Line
	3150 5000 3150 5300
Wire Wire Line
	4150 5000 4150 5400
Wire Wire Line
	4300 5000 4300 5400
Wire Wire Line
	5150 5000 5150 5450
Wire Wire Line
	5300 5000 5300 5450
$Comp
L USB_A J?
U 1 1 5A11EFF3
P 6400 3050
F 0 "J?" H 6200 3500 50  0001 L CNN
F 1 "USB_mini" H 6200 3400 50  0000 L CNN
F 2 "" H 6550 3000 50  0001 C CNN
F 3 "" H 6550 3000 50  0001 C CNN
	1    6400 3050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4750 2550 4750 2900
Wire Wire Line
	4750 3150 4650 3150
Wire Wire Line
	4650 3150 4650 2650
Wire Wire Line
	5950 2850 6100 2850
Wire Wire Line
	5950 2950 6100 2950
Wire Wire Line
	6100 2950 6100 3050
Wire Wire Line
	5950 3050 6050 3050
Wire Wire Line
	6050 3050 6050 3150
Wire Wire Line
	6050 3150 6100 3150
Wire Wire Line
	5950 3150 5950 3450
Wire Wire Line
	5950 3450 6500 3450
Connection ~ 6400 3450
$Comp
L USART-USB FT232RL
U 1 1 5A12F9E1
P 5350 3050
F 0 "FT232RL" H 5350 3100 60  0000 C CNN
F 1 "USART-USB" H 5350 3400 60  0000 C CNN
F 2 "" H 5350 3400 60  0001 C CNN
F 3 "" H 5350 3400 60  0001 C CNN
	1    5350 3050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
