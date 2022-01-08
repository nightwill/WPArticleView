// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "WPArticleView",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "WPArticleView", targets: ["WPArticleView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.0.0"),
    ],
    targets: [
        .target(name: "WPArticleView", dependencies: ["SwiftSoup"]),
    ]
)
