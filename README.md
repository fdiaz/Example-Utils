# Reproduction of Issue with Tuist and Local Swift Packages

This repository demonstrates an issue encountered when using **Tuist** in combination with **local Swift Package Manager (SPM) packages**.

## Project Structure & Dependencies

Below is a diagram of the dependencies:

![Dependency Diagram](img/diagram.png)

- [`SupportingFiles`](https://github.com/fdiaz/Example-SupportingFiles/blob/8c4a8d2b79b9c8757ea7dee66c3d86c617e951e3/Package.swift):  
  A local SPM package defined in a separate repo that depends on this repo.

- [`Utils`](https://github.com/fdiaz/Example-Utils/blob/c8935af5f9586bfed8b55c6e125a57e11e5ab634/Package.swift):  
  A local SPM package, defined in this repo.

- [`UtilsDemo`](https://github.com/fdiaz/Example-Utils/blob/c8935af5f9586bfed8b55c6e125a57e11e5ab634/Project.swift):  
  A Tuist project that uses the `Utils` SPM package as a local dependency.

---

## Reproducing the Issue

### Requirements

- [Tuist](https://tuist.dev/)
- Xcode

### Steps

```sh
tuist install
tuist generate
```

Which errors with:

```sh
Swift/arm64e-apple-macos.swiftinterface:14708: Fatal error: Duplicate values for key: '/Users/fdiaz/Example-Utils'
[1]    65975 trace trap  tuist generate
```

## Root Cause Hypothesis

The crash occurs in Tuist’s GraphLoader, specifically inside the internal [Cache class](https://github.com/tuist/tuist/blob/e721bc33fa03cdff73ab98b0705930731c3aff8b/cli/Sources/TuistCore/Graph/GraphLoader.swift#L344):

```swift
final class Cache {
    let allProjects: [AbsolutePath: Project]
    …
    
    init(projects: [Project]) {
        let allProjects = Dictionary(uniqueKeysWithValues: projects.map { ($0.path, $0) })
        …
    }
}
```

In the setup of this repo, both the SPM package `Utils` and the Tuist project `Utils-Tuist` (which contains the `UtilsDemo` target) are defined in the same root directory, leading to a duplicate AbsolutePath, making `Dictionary(uniqueKeysWithValues:)` throws a fatal error since we're using the path as the unique key value.

If we move the `Project.swift` file into another directory, we see this issue manifesting now because there are 2 Util packages - we believe this is related to having a remote Utils package (from `SupportingFiles`) and a local one.
