// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "UtilsDemo",
    products: [
          .executable(name: "UtilsDemo", targets: ["UtilsDemo"]),
    dependencies: [
        .package(path: "../"),
        .package(url: "https://github.com/fdiaz/Example-SupportingFiles.git", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "UtilsDemo",
            dependencies: [
                "Utils",
                .product(name: "SupportingFiles", package: "Example-SupportingFiles")
            ]
        )
    ]
)
