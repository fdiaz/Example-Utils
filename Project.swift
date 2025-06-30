import ProjectDescription

let project = Project(
    name: "Utils-Tuist",
    targets: [
        .target(
            name: "UtilsWrapper",
            destinations: .macOS,
            product: .commandLineTool,
            bundleId: "io.example.UtilsWrapper",
            deploymentTargets: .macOS("15.0"),
            infoPlist: .default,
            sources: ["Demo/**"],
            dependencies: [
                .external(name: "Utils"),
                .external(name: "SupportingFiles"),
            ]
        )
    ]
)
