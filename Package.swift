// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VaporMakerCommands",
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
                .copy("VaporMakerCommands/Resources")
            ]
        ),
        .testTarget(
            name: "VaporMakerCommandsTests",
            dependencies: ["VaporMakerCommands"]
        ),
    ]
)
