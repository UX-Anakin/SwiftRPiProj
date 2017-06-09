# Raspberry Pi 
Servo motors are controlled by pulses of varying lengths.This requires fairly accurate timing.The Raspberry Pi has one pin that generates pluses in hardware,without having to rely on the operating system.

Servo Motors:
  The position of the servo motor is set by the length of a pulse.The servo expects to receive a pulse roughly every 20 milliseconds. If that pulse is high for 1millisecond, then the servo angle will be zero, if it is 1.5 milliseconds, then it will be at its centre position and if it is 2 milliseconds it will be at 180 degrees.
  
## Hardware
  There is only one pin on the Pi that is capable of producing pulses in this way(GPIO pin 18). This will be connected to the control pin of the servo.The power to the servo is provided by an external battery as powering the servo from the Pi itself is likely to cause it to crash as the Servo draws too much current as it starts to move. Servos require 4.8-6V DC power to the motor, but the signal level (pulse output) can be 3.3V, which is how its OK to just connect the signal line directory to the GPIO output of the Pi.
  Servo motors generally come with three pin sockets attached.The red and brown sockets supply power (positive to red) and the third yellow or orange socket is for the control signal.
  
## Software
Using the great wiringPi tool gpio to control the servo
```
sudo rpi-update
sudo apt-get install -y wiringpi
```
Set pin#18 to be a PWM output
```
gpio -g mode 18 pwm 
```
Pin #18 has PWM output, but you have to set it to be the right frequency output.Servo's want 50Hz frequency output.
For the Raspberry Pi PWM module, the **PWM Frequency in Hz = 19,200,000 Hz / pwmClock / pwmRange**
  If **pwmClock = 192** and ***pwmRange = 2000* we'll get the PWM frequency = 50 Hz
```
gpio pwm-ms
gpio pwmc 192
gpio pwmr 2000
```
Now you can set the servo to all the way to the left(1.0 milliseconds) with
```
gpio -g pwm 18 100
```
Set the servo to the middle (1.5 ms) with
```
gpio -g pwm 18 150
```
And all the way to the right (2.0 ms) with
```
gpio -g pwm 18 200
```
Note that the Raspberry Pi PWM is not necessarily a 'stable' output, and there might be some jitter!

## Python Example!
```
sudo apt-get install -y python-pip
sudo pip3 install wiringpi
```
The Python program to make the servo sweep back and forth is listed below:
```
   1 # Servo Control
   2 import time
   3 import wiringpi
   4
   5 # use 'GPIO naming'
   6 wiringpi.wiringPiSetupGpio()
   7
   8 # set #18 to be a PWM output
   9 wiringpi.pinMode(18, wiringpi.GPIO.PWM_OUTPUT)
  10
  11 # set the PWM mode to milliseconds stype
  12 wiringpi.pwmSetMode(wiringpi.GPIO.PWM_MODE_MS)
  13
  14 # divide down clock
  15 wiringpi.pwmSetClock(192)
  16 wiringpi.pwmSetRange(2000)
  17
  18 delay_period = 0.01
  19
  20 while True:
  21     for pulse in range(50, 250, 1):
  22         wiring.pwmWrite(18, pulse)
  23         time.sleep(delay_period)
  24     for pulse in range(250, 50, -1):
  25         wiringpi.pwmWrite(18, pulse)
  26         time.sleep(delay_period)
```
