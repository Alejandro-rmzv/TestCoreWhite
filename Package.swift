// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestCoreWhite",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Producto principal (puede quedar vacío o con utilidades comunes)
        .library(
            name: "TestCoreWhite",
            targets: ["TestCoreWhite"]
        ),

        // Producto que expone el módulo donde está tu clase Test
        .library(
            name: "TestWhite",
            targets: ["TestWhite"]
        )
    ],
    targets: [
        // Target base
        .target(
            name: "TestCoreWhite",
            path: "Sources/TestCoreWhite"
        ),

        // Target donde vive Test()
        .target(
            name: "TestWhite",
            path: "Sources/TestWhite"
        ),

        // Tests (opcional)
        .testTarget(
            name: "TestCoreWhiteTests",
            dependencies: ["TestCoreWhite", "TestWhite"],
            path: "Tests/TestCoreWhiteTests"
        )
    ]
)
