// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-tca-transitions",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "CircleTransition", targets: ["CircleTransition"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "0.47.2"
        )
    ],
    targets: [
        .target(
            name: "CircleTransition",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        )
    ]
)
