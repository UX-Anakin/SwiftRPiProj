import SwiftyGPIO
import Foundation
/*
Note: SwiftyGPIO uses Broadcom numbering scheme to assign a number to each pin
*/

// Get a dictionary of all the gpio pins
let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi3)

// Get the pin that you connected the button and shock . Remember to set the right pin number, for me it was button = GPIO4, shock = GPIO17
guard let buttonGpio = gpios[GPIOName.P4], let shockGpio = gpios[GPIOName.P17] else {
    fatalError("Could not initialize the gpio")
}

// Set the GPIO4 direction to .IN and GPIO17 direction to OUT and turn it on
buttonGpio.direction = .IN
shockGpio.direction = .OUT
shockGpio.value = 1

// Read user input from keyboard and switch the shock on/off each time the user presses the return key
print("Press return to switch the shock on/off. To quit type exit")
while let userInput = readLine(strippingNewline: true), userInput != "exit" , buttonGpio.value != 1 {
    print("Switching Shock ON/OFF")
    print("The button is \(buttonGpio.value)")
    shockGpio.value = shockGpio.value == 0 ? 1 : 0
}
print("The button is \(buttonGpio.value)")
print("Hello, world!")
