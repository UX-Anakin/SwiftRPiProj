# SwiftPRiProj

![SwiftPRiProj logo](/img/SwiftRPiProj.png)

Hello there! I'm **SwiftPRiProj**, the open source **Raspberry Pi + Swift 3.0 + SwiftyGPIO**.

**Welcome to SwiftPRiProj!**

Swift is a high-performance system programming language. It has a clean and modern syntax, offers seamless access to existing C and Objective-C code and frameworks, and is memory safe by default.

You can do quite a bit with GPIO(general purpose input/output) pins on devices like the Raspberry Pi. Here I'll show you how to set it up to perform a couple of simple tasks, like blink and LED and Read button, read the temperature from temperature sensor called the DS18B20.

It may be worthwhile to install [WiringPi](http://wiringpi.com/download-and-install/) so you can test GPIO connections via the command line rather than compiling swift every time. For example with pin 17 connected to LED:

	$ gpio mode 17 out
	$ gpio write 17 0
	$ gpio write 17 1
	
You should see the LED turn ON/OFF

Check out [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO),Using this, we're going to build on them to read from a 1-wire digital temperature sensor(DS18B20).Let's get started configuraing the Pi to use the 1-wire interface.



## Getting Started

Compile different Project, just change the **Sources/xx.swift** to **Sources/main.swift**. Then:

	$ swift --version
	Swift version 3.0.2 (swift-3.0.2-RELEASE)
	Target: armv7--linux-gnueabihf
	$ mv Sources/ButtonLED.swift Sources/main.swift
	$ swift package update
	$ swift build clean
	$ swift build
	$ ./.build/debug/SwiftPRiProj
	
	
## ButtonLED.swift

# Pi 3
![RPi 3 GPIO](/img/Pi3GpioReadall.png)

