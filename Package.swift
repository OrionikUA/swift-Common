// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftCommon",
    products: [
        .library(
            name: "SwiftCommon",
            targets: ["SwiftCommon"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftCommon",
            dependencies: [],
            path: "Sources"),
    ]
)
