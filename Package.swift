// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Utils",
    products: [
        .library(name: "Utils", targets: ["Utils"]),
    ],
    targets: [
        .target(name: "Utils")
    ]
)
