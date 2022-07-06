
import SwiftUI
import Combine

struct Controller: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var header : Header
    @State public var selectTabMenu: BottomMenuType = .input
    @State private var labelPosX:CGFloat = 0
    @State private var isBottomSheet: Bool = false
    let container: DIContainer
    @State var cancellables = Set<AnyCancellable>()
    @ObservedObject private(set) var viewModel: ViewModel

    public static func bottomSheet<MContent: View>(@ViewBuilder content: () -> MContent) -> some View {
        return content()
    }
    
    init(container: DIContainer) {
        self.container = container
        self.viewModel = .init(container: container)
    }
    
    var contents: some View {
        return ZStack {
            switch router.screen {
            case .first(let regist):
                FirstScreen(viewModel: FirstScreen.ViewModel(container: container), registed: regist)
            case .second:
                SecondScreen()
            case .third:
                ThirdScreen()
            case .setting:
                SettingScreen()
            case .list:
                ListScreen(viewModel: .init(container: container))
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
                        
                        if router.screen == .first(true) {
                            Text("取引を登録しました")
                                .frame(maxWidth: .infinity, maxHeight: 90, alignment: .center)
                                .background(Color.white)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                        router.screen = .first(false)
                                    }
                                }
                        }
                    }
                    
                    contents
                        .frame(maxHeight: .infinity)
                        .background(Color.backGroundColor)
                    
                    if (router.screen.isShowFooter()){
                        footer
                            .frame(maxHeight: 60)
                            .background(Color.backGroundColor)
                    }
                    
                    
                    if router.screen.isShowBottomMenu() {
                        bottomMenu
                            .frame(height: 60)
                            .background(Color.white)
                    }
                    
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
