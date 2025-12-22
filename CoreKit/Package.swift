//
//  Package.swift
//  CoreKit
//
//  Created by Jose Alejandro Ramirez Vergara on 22/12/25.
//

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
