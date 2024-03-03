// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "soleverse",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.83.1"),
        // 🗄 An ORM for SQL and NoSQL databases.
        .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
        // 🐘 Fluent driver for Postgres.
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.7.2"),
        // 🪶 Fluent driver for SQLite.
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.6.0")
    ],
    targets: [
        .target(name: "Domain"),
        .target(
            name: "Data",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                "Domain"
            ]
        ),
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "Domain",
                "Data"
            ]
        ),
        .testTarget(name: "DomainTests", dependencies: [.target(name: "Domain")]),
        .testTarget(
            name: "DataTests",
            dependencies: [
                .target(name: "Data"),
                .product(name: "XCTVapor", package: "vapor"),
                .product(name: "Fluent", package: "Fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver")
            ]
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                .target(name: "App"),
                .product(name: "XCTVapor", package: "vapor"),

                // Workaround for https://github.com/apple/swift-package-manager/issues/6940
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "Fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver")
            ]
        )
    ]
)
