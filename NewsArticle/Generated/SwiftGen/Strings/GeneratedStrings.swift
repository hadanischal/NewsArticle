// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  internal enum DashBoard {
    /// Select Categories
    internal static let categoriesNavigationTitle = L10n.tr("DashBoard", "CATEGORIES_NAVIGATION_TITLE")
    /// Unable to find selected category
    internal static let categoriesNotFoundMessage = L10n.tr("DashBoard", "CATEGORIES_NOT_FOUND_MESSAGE")
    /// Please select the category
    internal static let categoriesNotFoundTitle = L10n.tr("DashBoard", "CATEGORIES_NOT_FOUND_TITLE")
    /// News Detail
    internal static let newsDetailNavigationTitle = L10n.tr("DashBoard", "NEWS_DETAIL_NAVIGATION_TITLE")
    /// News
    internal static let newsListNavigationTitle = L10n.tr("DashBoard", "NEWS_LIST_NAVIGATION_TITLE")
    /// Unable to get selected source
    internal static let sourceNotFoundMessage = L10n.tr("DashBoard", "SOURCE_NOT_FOUND_MESSAGE")
    /// Please select the source
    internal static let sourceNotFoundTitle = L10n.tr("DashBoard", "SOURCE_NOT_FOUND_TITLE")
    /// Select Sources
    internal static let sourcesNavigationTitle = L10n.tr("DashBoard", "SOURCES_NAVIGATION_TITLE")
  }
  internal enum Mock {
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
