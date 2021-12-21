// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "A51Services",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "A51Services",
            targets: ["A51Services"]),
    ],
    dependencies: [
        .package(url: "https://github.com/argentlabs/web3.swift", from: "0.7.0"),
    ],
    targets: [
        .target(
            name: "A51Services",
            dependencies: ["web3.swift"]),
        .testTarget(
            name: "A51ServicesTests",
            dependencies: ["A51Services"]),
    ]
)
