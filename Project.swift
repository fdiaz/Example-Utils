import ProjectDescription

let project = Project(
    name: "Utils-Tuist",
    packages: [
        .package(path: "./"),
        .package(url: "https://github.com/fdiaz/Example-SupportingFiles.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "UtilsDemo",
            destinations: .macOS,
            product: .commandLineTool,
            bundleId: "io.example.UtilsDemo",
            deploymentTargets: .macOS("15.0"),
            infoPlist: .default,
            sources: ["Demo/**"],
            dependencies: [
                .package(product: "Utils"),
                .package(product: "SupportingFiles")
            ]
        )
    ]
)
