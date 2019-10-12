// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SwiftyCast",

    platforms: [
        .iOS("8.0"),
        .macOS("10.10"),
        .tvOS("9.0"),
        .watchOS("2.0")
    ],

    products: [
        .library(name: "SwiftyCast", targets: ["SwiftyCast"])
    ],

    targets: [
        .target(name: "SwiftyCast", path: "SwiftyCast"),
        .testTarget(name: "SwiftyCastTests", dependencies: ["SwiftyCast"], path: "SwiftyCastTests")
    ]
)
