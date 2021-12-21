// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "A51Presentation",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "A51Presentation",
            targets: ["A51Presentation"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "A51Presentation",
            dependencies: []),
        .testTarget(
            name: "A51PresentationTests",
            dependencies: ["A51Presentation"]),
    ]
)
