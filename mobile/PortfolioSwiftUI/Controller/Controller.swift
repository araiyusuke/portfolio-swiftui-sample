import SwiftUI
import Combine
import ResizableSheet

struct Controller: ScreenMovable {
    @EnvironmentObject var router: Router
    @EnvironmentObject var header: HeaderManager
    @EnvironmentObject var transactionInputRouter: TransactionInputRouter
    @EnvironmentObject var bottomTabManager: BottomTabManager
    @State private var labelPosX: CGFloat = 0
    @State private var isBottomSheet: Bool = false
    @State var cancellables = Set<AnyCancellable>()
    @State var selection: Int = 1
    @State var isHidden: Bool = false
    @State public var selectTabMenu: BottomMenuType = .input
    let container: DIContainer
    init(container: DIContainer) {
        self.container = container
    }
    var body: some View {
        // 一番上の階層
        VStack(spacing: 0) {
            if router.screen == .transactionInput {
                headerTop
                    .frame(maxWidth: .infinity, maxHeight: adjust(100))
                    .background(Asset.lightBlue.color)
            }

            contents
                .navigationBarColor(Asset.lightBlue.color)

            if transactionInputRouter.screen == .second || transactionInputRouter.screen == .third {
                EmptyView()
            } else {
                if bottomTabManager.isShow {
                    bottomMenu
                        .adjustSize(height: 60)
                }
            }
        }
        .environment(\.resizableSheetCenter, resizableSheetCenter)
        .toast()
    }
    var contents: some View {
        return ZStack {
            switch router.screen {
            case .login:
                LoginScreen()
            case .help:
                HelpScreen()
            case .receipt:
                ReceiptScreen()
            case .setting:
                SettingScreen()
            case .transactionInput:
                TransactionInputScreen(container: container)
            case .transactionList:
                TransactionsListScreen(viewModel: .init(container: container))
            }
        }
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        ModifiedContent(content: self, modifier: HiddenNavigationBar())
    }
}

struct NavigationBarModifier: ViewModifier {
    let backgroundColor: Color
    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = UIColor(backgroundColor)
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: Color) -> some View {

        modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}

extension UIColor {
    class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
