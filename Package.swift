import PackageDescription

let package = Package(
    name: "buttonTest",
    dependencies: [
        .Package(url: "https://github.com/uraimo/SwiftyGPIO.git", majorVersion: 0)
    ]
)
