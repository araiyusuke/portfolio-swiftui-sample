// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let bottomMenuBack = ColorAsset(name: "bottom_menu_back")
  internal static let bottomSheetTitleBack = ColorAsset(name: "bottom_sheet_title_back")
  internal static let circleButton = ColorAsset(name: "circle_button")
  internal static let inputIcon = ImageAsset(name: "input_icon")
  internal static let inputText = ColorAsset(name: "input_text")
  internal static let lightBlue = ColorAsset(name: "light_blue")
  internal static let lightGray = ColorAsset(name: "light_gray")
  internal static let listBack = ColorAsset(name: "list_back")
  internal static let listIcon = ImageAsset(name: "list_icon")
  internal static let moneyYellow = ColorAsset(name: "money_yellow")
  internal static let pencilIcon = ImageAsset(name: "pencil_icon")
  internal static let pullDown = ImageAsset(name: "pull_down")
  internal static let red = ColorAsset(name: "red")
  internal static let removeIcon = ImageAsset(name: "remove_icon")
  internal static let rightAllowIcon = ImageAsset(name: "right_allow_icon")
  internal static let screenBackColor = ColorAsset(name: "screen_back_color")
  internal static let searchIcon = ImageAsset(name: "search_icon")
  internal static let sortIcon = ImageAsset(name: "sort_icon")
  internal static let toastBack = ColorAsset(name: "toast_back")
  internal static let white = ColorAsset(name: "white")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  fileprivate let name: String

  internal var color: Color {
    Color(self)
  }
}

internal extension Color {
  /// Creates a named color.
  /// - Parameter asset: the color resource to lookup.
  init(_ asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

internal struct ImageAsset {
  fileprivate let name: String

  internal var image: Image {
    Image(name)
  }
}

internal extension Image {
  /// Creates a labeled image that you can use as content for controls.
  /// - Parameter asset: the image resource to lookup.
  init(_ asset: ImageAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(asset.name, bundle: bundle)
  }
}

private final class BundleToken {}
