// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TelemetryHelper",
    products: [
        .executable(
            name: "TelemetryHelper",
            targets: ["TelemetryHelper"]),
    ],
    dependencies: [
      .package(name: "SwiftProtobuf", url: "https://github.com/apple/swift-protobuf.git", from: "1.6.0"),
      .package(name: "swift-argument-parser", url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "TelemetryHelper",
            dependencies: ["SwiftProtobuf", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(
            name: "TelemetryHelperTests",
            dependencies: ["TelemetryHelper"]),
    ]
)
