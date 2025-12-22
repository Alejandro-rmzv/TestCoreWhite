// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CoreKit",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(name: "CoreKit", targets: ["CoreKit"])
  ],
  targets: [
    .target(
      name: "CoreKit",
      dependencies: [],
      path: "Sources/CoreKit"
    ),
    .testTarget(
      name: "CoreKitTests",
      dependencies: ["CoreKit"],
      path: "Tests"
    )
  ]
)
