
import SwiftUI
import Combine
import ResizableSheet

struct Controller: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var header : Header
    @EnvironmentObject var transactionInputRouter: TransactionInputRouter
//    @ObservedObject private(set) var viewModel: ViewModel

    @State public var selectTabMenu: BottomMenuType = .input
    @State private var labelPosX:CGFloat = 0
    @State private var isBottomSheet: Bool = false
    @State var cancellables = Set<AnyCancellable>()

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
//        self.viewModel = .init(container: container)
    }
    
    var contents: some View {
        return ZStack {
            switch router.screen {
                
            // 取引入力
            case .transactionInput(_):
                TransactionInputScreen(container: container)
                          
            case .setting:
                SettingScreen()
            // 取引一覧
            case .transactionList:
                ListScreen(viewModel: .init(container: container))
            case .receipt:
                ReceiptScreen()
            case .help:
                HelpScreen()
            }
        }
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                VStack(spacing: 0) {
                    
                    ZStack {
                        headerTop
                            .frame(width: geometry.size.width , height: 100)
                            .background(Color.headerColor)
                            .onTapGesture {
                                isBottomSheet.toggle()
                                print(geometry.size.width)
                            }
                        
                        if router.screen == .transactionInput(true) {
                            Text("取引を登録しました")
                                .frame(maxWidth: .infinity, maxHeight: 90, alignment: .center)
                                .background(Color.white)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                        router.screen = .transactionInput(false)
                                    }
                                }
                        }
                    }
                    
                    contents
                        .frame(maxHeight: .infinity)
                        .background(Color.backGroundColor)
                    
                    if router.screen.isShowBottomMenu() {
                        bottomMenu
                            .frame(height: 60)
                            .background(Color.white)
                    }
                    
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .environment(\.resizableSheetCenter, resizableSheetCenter)
        }
    }
}
