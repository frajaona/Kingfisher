// swift-tools-version:5.1
import PackageDescription

var excludes = [String]()
#if os(macOS)
	excludes.append("AnimatedImageView.swift")
	excludes.append("UIButton+Kingfisher.swift")
	excludes.append("WKInterfaceImage+Kingfisher.swift")
#else
	excludes.append("NSButton+Kingfisher.swift")
	#if !os(watchOS)
	excludes.append("WKInterfaceImage+Kingfisher.swift")
	#endif
#endif

let package = Package(
    name: "Kingfisher",
    platforms: [.iOS(.v8), .macOS(.v10_10), .tvOS(.v9), .watchOS(.v3)],
    products: [
        .library(name: "Kingfisher", targets: ["Kingfisher"])
    ],
    targets: [
        .target(
            name: "Kingfisher",
            path: "Sources",
            exclude: excludes
        )
    ]
)