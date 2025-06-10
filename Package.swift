// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "UtilitiesToolkit",
    products: [
        .library(name: "UtilitiesToolkit", targets: ["UtilitiesToolkit"]),
    ],
    targets: [
        .target(name: "UtilitiesToolkit")
    ]
)