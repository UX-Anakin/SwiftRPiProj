import PackageDescription

let package = Package(
    name: "SwiftPRiProj",
    dependencies: [
        .Package(url: "https://github.com/uraimo/SwiftyGPIO.git", majorVersion: 0)
    ]
)
