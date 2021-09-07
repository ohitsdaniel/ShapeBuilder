// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "ShapeBuilder",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15)
  ],
  products: [
    .library(
      name: "ShapeBuilder",
      targets: ["ShapeBuilder"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/shibapm/Rocket", from: "1.2.0"), // dev
    .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing", .upToNextMajor(from: "1.9.0")) // dev
  ],
  targets: [
    .target(
      name: "ShapeBuilder",
      dependencies: []
    ),
    .testTarget(name: "ShapeBuilderTests", dependencies: ["ShapeBuilder", "SnapshotTesting"], exclude: ["__Snapshots__"]) // dev
  ],
  swiftLanguageVersions: [.v5]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfiguration(
  [
    "rocket": [
      "pre_release_checks": [
        "clean_git"
      ]
    ]
  ]
)
.write()
#endif
