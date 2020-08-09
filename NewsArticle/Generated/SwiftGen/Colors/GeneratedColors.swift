// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 80% <br/> (0x000000cc)
  internal static let black100trans80 = ColorName(rgbaValue: 0x000000cc)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5c9ac1"></span>
  /// Alpha: 100% <br/> (0x5c9ac1ff)
  internal static let moderateCyan = ColorName(rgbaValue: 0x5c9ac1ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#01ffff"></span>
  /// Alpha: 100% <br/> (0x01ffffff)
  internal static let neon100 = ColorName(rgbaValue: 0x01ffffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4b99e4"></span>
  /// Alpha: 100% <br/> (0x4b99e4ff)
  internal static let primary = ColorName(rgbaValue: 0x4b99e4ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33ff99"></span>
  /// Alpha: 100% <br/> (0x33ff99ff)
  internal static let rarthGreen100 = ColorName(rgbaValue: 0x33ff99ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d0021b"></span>
  /// Alpha: 100% <br/> (0xd0021bff)
  internal static let redEnergy100 = ColorName(rgbaValue: 0xd0021bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fff572"></span>
  /// Alpha: 100% <br/> (0xfff572ff)
  internal static let strikingYellow100 = ColorName(rgbaValue: 0xfff572ff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
