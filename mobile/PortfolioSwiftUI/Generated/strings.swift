// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// 科目
  internal static let account = L10n.tr("Localizable", "account")
  /// 戻る
  internal static let back = L10n.tr("Localizable", "back")
  /// 摘要
  internal static let descriptions = L10n.tr("Localizable", "descriptions")
  /// 支出
  internal static let expenses = L10n.tr("Localizable", "expenses")
  /// ヘルプ
  internal static let help = L10n.tr("Localizable", "help")
  /// 収入
  internal static let incomes = L10n.tr("Localizable", "incomes")
  /// 入力
  internal static let input = L10n.tr("Localizable", "input")
  /// 取引入力
  internal static let inputTransaction = L10n.tr("Localizable", "input transaction")
  /// 一覧
  internal static let list = L10n.tr("Localizable", "list")
  /// ログアウト
  internal static let logout = L10n.tr("Localizable", "logout")
  /// その他
  internal static let others = L10n.tr("Localizable", "others")
  /// 金額
  internal static let price = L10n.tr("Localizable", "price")
  /// 削除
  internal static let remove = L10n.tr("Localizable", "remove")
  /// 保存
  internal static let save = L10n.tr("Localizable", "save")
  /// 検索
  internal static let search = L10n.tr("Localizable", "search")
  /// 設定
  internal static let settings = L10n.tr("Localizable", "settings")
  /// 取引
  internal static let transaction = L10n.tr("Localizable", "transaction")
  /// 取引日
  internal static let transactionDate = L10n.tr("Localizable", "transaction date")
  /// 取引一覧
  internal static let transactions = L10n.tr("Localizable", "transactions")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

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
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
