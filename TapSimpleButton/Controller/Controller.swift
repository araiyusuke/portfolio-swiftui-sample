
import SwiftUI
import Combine
import ResizableSheet

struct Controller: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var inputTransactionRouter : TransactionInputRouter
    @EnvironmentObject var header : Header
    @EnvironmentObject var transactionInputRouter: TransactionInputRouter
    @EnvironmentObject var headerManager : HeaderManager
    
    @State private var labelPosX:CGFloat = 0
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
        
        NavigationView {
            VStack(spacing: 0) {
                
                ZStack {
                    
                    if router.screen == .transactionInput(false) {
                        headerTop
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .background(Color.headerColor)
                    }
                   
                    
                    
                    if inputTransactionRouter.screen == .first(true) {
                        Text("取引を登録しました")
                            .frame(maxWidth: .infinity, maxHeight: 90, alignment: .center)
                            .background(Color.white)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    inputTransactionRouter.screen = .first(false)
                                }
                            }
                    }
                }
                
                contents
                    .navigationBarColor(UIColor.rgba(red: 144, green: 204, blue: 240, alpha: 1))

                if inputTransactionRouter.screen == .second &&  inputTransactionRouter.screen == .third {
                    EmptyView()
                } else {
                    bottomMenu
                        .frame(height: 60)
                        .background(Color.headerColor)
                }

                
            }

        }
        .environment(\.resizableSheetCenter, resizableSheetCenter)

    }
    
    var contents: some View {
        return ZStack {
            switch router.screen {
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
//                    .environment(\.resizableSheetCenter, resizableSheetCenter)
            }
        }
    }
    
    var tab: some View {
        
        TabView(selection: $selection) {
            
            TransactionsListScreen(viewModel: .init(container: container))
//                .environment(\.resizableSheetCenter, resizableSheetCenter)
                .tabItem {
                    Image(systemName: "apps.ipad.landscape")
                }
                .tag(0)
            
            TransactionInputScreen(container: container)
                .tabItem {
                    Image(systemName: "text.insert")
                    
                }
                .tag(1)
            
            ReceiptScreen()
                .tabItem {
                    Image(systemName: "camera")
                }
                .tag(2)
            
            HelpScreen()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                }
                .tag(3)
            
            SettingScreen()
                .tabItem {
                    Image(systemName: "gearshape")
                }
                .tag(4)
        }
        .frame(maxHeight: .infinity)
        .background(Color.backGroundColor)
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
    let backgroundColor: UIColor

    init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor

        // [1]
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        // [2]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }

    func body(content: Content) -> some View {
        // [3]
        content
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: UIColor) -> some View {
        modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}

extension UIColor {
    class func rgba(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
