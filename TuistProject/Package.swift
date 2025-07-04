// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Utils-Packages",
    products: [],
    dependencies: [
        .package(path: "../"),
        .package(url: "https://github.com/fdiaz/Example-SupportingFiles.git", from: "1.0.0"),
    ]
)
