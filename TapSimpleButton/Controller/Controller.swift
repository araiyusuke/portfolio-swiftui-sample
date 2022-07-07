
import SwiftUI
import Combine
import ResizableSheet

struct Controller: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var inputTransactionRouter : TransactionInputRouter
    @EnvironmentObject var header : Header
    @EnvironmentObject var transactionInputRouter: TransactionInputRouter
    
    @State private var labelPosX:CGFloat = 0
    @State private var isBottomSheet: Bool = false
    @State var cancellables = Set<AnyCancellable>()
    @State var selection: Int = 1
    
    @State var isHidden: Bool = false

    let container: DIContainer
    
    // ボトムシートライブラリ
    var scene: UIWindowScene? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowScene = scene as? UIWindowScene else {
            return nil
        }
        return windowScene
    }
    
    var resizableSheetCenter: ResizableSheetCenter? {
        return scene.flatMap(ResizableSheetCenter.resolve(for:))
    }
    
    public static func bottomSheet<MContent: View>(@ViewBuilder content: () -> MContent) -> some View {
        return content()
    }
    
    init(container: DIContainer) {
        self.container = container
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            NavigationView {
                    
                    VStack(spacing: 0) {
                        
                        ZStack {
                            headerTop
                                .frame(width: geometry.size.width , height: 100)
                                .background(Color.headerColor)
                                .onTapGesture {
                                    isBottomSheet.toggle()
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
                        
                        tab

                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                    .environment(\.resizableSheetCenter, resizableSheetCenter)
                    .hiddenNavigationBarStyle()

                }
                    
               
            }
    }
    
    var tab: some View {
        TabView(selection: $selection) {
            
            TransactionsListScreen(viewModel: .init(container: container))
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
