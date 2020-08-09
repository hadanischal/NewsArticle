// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - JSON Files

// swiftlint:disable identifier_name line_length type_body_length
internal enum JSONFiles {
  internal enum Categories {
    private static let _document = JSONDocument(path: "Categories.json")
    internal static let categories: [String] = _document["categories"]
  }
  internal enum Countries {
    private static let _document = JSONDocument(path: "Countries.json")
    internal static let articles: [[String: Any]] = _document["articles"]
    internal static let status: String = _document["status"]
    internal static let totalResults: Int = _document["totalResults"]
  }
  internal enum Endpoints {
    private static let _document = JSONDocument(path: "Endpoints.json")
    internal static let endpointList: [[String: Any]] = _document["endpointList"]
    internal static let status: String = _document["status"]
    internal static let totalResults: Int = _document["totalResults"]
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

private func objectFromJSON<T>(at path: String) -> T {
  let bundle = BundleToken.bundle
  guard let url = bundle.url(forResource: path, withExtension: nil),
    let json = try? JSONSerialization.jsonObject(with: Data(contentsOf: url), options: []),
    let result = json as? T else {
    fatalError("Unable to load JSON at path: \(path)")
  }
  return result
}

private struct JSONDocument {
  let data: [String: Any]

  init(path: String) {
    self.data = objectFromJSON(at: path)
  }

  subscript<T>(key: String) -> T {
    guard let result = data[key] as? T else {
      fatalError("Property '\(key)' is not of type \(T.self)")
    }
    return result
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
