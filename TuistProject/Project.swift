import ProjectDescription

let project = Project(
    name: "Utils-Tuist",
    targets: [
        .target(
            name: "UtilsDemo",
            destinations: .macOS,
            product: .commandLineTool,
            bundleId: "io.example.UtilsDemo",
            deploymentTargets: .macOS("15.0"),
            infoPlist: .default,
            sources: ["../Demo/**"],
            dependencies: [
                .external(name: "Utils"),
                .external(name: "SupportingFiles"),
            ]
        )
    ]
)
