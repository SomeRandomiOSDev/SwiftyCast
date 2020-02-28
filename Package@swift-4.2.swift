// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "SwiftyCast",

    products: [
        .library(name: "SwiftyCast", targets: ["SwiftyCast"])
    ],

    targets: [
        .target(name: "SwiftyCast"),
        .testTarget(name: "SwiftyCastTests", dependencies: ["SwiftyCast"])
    ],

    swiftLanguageVersions: [.v4, .v4_2]
)
