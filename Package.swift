// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CryptoAddressValidator",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "CryptoAddressValidator",
            targets: ["CryptoAddressValidator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: Version(5, 0, 0)),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: Version(1, 0, 0)),
    ],
    targets: [
        .target(
            name: "CryptoAddressValidator",
            dependencies: ["BigInt", "CryptoSwift", "CBlake2"]),
        .target(name: "CBlake2"),
        .testTarget(
            name: "CryptoAddressValidatorTests",
            dependencies: ["CryptoAddressValidator"]
        ),
        .testTarget(
            name: "Blake2Tests",
            dependencies: ["CryptoAddressValidator"],
            resources: [.copy("blake2-kat.json")]
        )
    ]
)
