// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "UITesting",
  products: [
    .library(name: "UITesting", targets: ["UITesting"]),
  ],
  targets: [

    .target(
      name: "UITesting"
    ),

    .testTarget(
      name: "Example",
      dependencies: ["UITesting"]
    )
  ]
)
