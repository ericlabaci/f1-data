// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum RaceResultsStrings {
  internal enum Navigation {
    /// %@ %@
    internal static func title(_ p1: Any, _ p2: Any) -> String {
      return RaceResultsStrings.tr("RaceResultsLocalizable", "Navigation.Title", String(describing: p1), String(describing: p2), fallback: "%@ %@")
    }
  }
  internal enum PointsGained {
    /// Points Gained %@
    internal static func title(_ p1: Any) -> String {
      return RaceResultsStrings.tr("RaceResultsLocalizable", "PointsGained.Title", String(describing: p1), fallback: "Points Gained %@")
    }
  }
  internal enum PositionsGained {
    /// Positions %@
    internal static func title(_ p1: Any) -> String {
      return RaceResultsStrings.tr("RaceResultsLocalizable", "PositionsGained.Title", String(describing: p1), fallback: "Positions %@")
    }
  }
  internal enum StartingPosition {
    /// Starting Position %@
    internal static func title(_ p1: Any) -> String {
      return RaceResultsStrings.tr("RaceResultsLocalizable", "StartingPosition.Title", String(describing: p1), fallback: "Starting Position %@")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension RaceResultsStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
