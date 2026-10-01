// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-point",
    platforms: [.macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27)],
    products: [.library(name: "Point", targets: ["Point"])],
    traits: [
        .trait(name: "Tagged", description: "Tagged integration"),
        .trait(name: "Affine", description: "Affine integration"),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-displacement.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-coordinate.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-affine.git", branch: "main", traits: [.trait(name: "Tagged", condition: .when(traits: ["Affine"])), .trait(name: "Vector", condition: .when(traits: ["Affine"]))]),
        .package(url: "https://github.com/swift-atoms/swift-vector.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),
    ],
    targets: [
        .target(name: "Point", dependencies: [
                .product(name: "Tagged", package: "swift-tagged", condition: .when(traits: ["Tagged"])),
                .product(name: "Displacement", package: "swift-displacement", condition: .when(traits: ["Affine"])),
                .product(name: "Coordinate", package: "swift-coordinate", condition: .when(traits: ["Affine"])),
                .product(name: "Affine", package: "swift-affine", condition: .when(traits: ["Affine"])),
            .product(name: "Vector", package: "swift-vector"),
        ]),
        .testTarget(name: "Point Tests", dependencies: [
            .target(name: "Point"),
            .product(name: "Tagged", package: "swift-tagged"),
        ]),
        .testTarget(name: "Point Affine Tests", dependencies: [
            .target(name: "Point"),
            .product(name: "Affine", package: "swift-affine", condition: .when(traits: ["Affine"])),
            .product(name: "Displacement", package: "swift-displacement", condition: .when(traits: ["Affine"])),
            .product(name: "Coordinate", package: "swift-coordinate", condition: .when(traits: ["Affine"])),
        ]),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
