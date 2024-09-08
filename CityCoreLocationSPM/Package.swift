// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CityCorelocationSPM",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CityCorelocationSPM",
            targets: ["CityCorelocationSPM"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CityCorelocationSPM",
            dependencies: [],
            path: "Sources/CityCorelocationSPM"
        ),
        .testTarget(
            name: "CityCorelocationSPMTests",
            dependencies: ["CityCorelocationSPM"],
            path: "Tests/CityCorelocationSPMTests"
        ),
    ]
)
