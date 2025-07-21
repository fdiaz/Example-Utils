import ProjectDescription

let project = Project(
    name: "Utils-Tuist",
    targets: [
        .target(
            name: "UtilsSDK",
            destinations: .macOS,
            product: .framework,
            bundleId: "io.example.Utils",
            deploymentTargets: .macOS("15.0"),
            infoPlist: .default,
            sources: ["../Sources/Utils/**"],
            dependencies: []
        ),
        .target(
            name: "UtilsDemo",
            destinations: .macOS,
            product: .commandLineTool,
            bundleId: "io.example.UtilsDemo",
            deploymentTargets: .macOS("15.0"),
            infoPlist: .default,
            sources: ["../Demo/**"],
            dependencies: [
                .external(name: "SupportingFiles"),
            ]
        )
    ]
)
