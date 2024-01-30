// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-tca-transitions",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "TCATransitions", targets: ["TCATransitions"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.7.0"
        )
    ],
    targets: [
        .target(
            name: "TCATransitions",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        )
    ]
)
