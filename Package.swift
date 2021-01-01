// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "vapor-maker-commands",
    products: [
        .library(
            name: "VaporMakerCommands",
            targets: ["VaporMakerCommands"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "VaporMakerCommands",
            dependencies: [
                .product(name:"Vapor", package: "vapor")
            ],
            resources: [
                .copy("Resources")
            ]
        ),
        .testTarget(
            name: "VaporMakerCommandsTests",
            dependencies: ["VaporMakerCommands"]
        ),
    ]
)
