
import SwiftUI


struct Controller: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var info : HeaderInfo
    @State public var selectTabMenu: BottomMenuType = .input
    @State private var labelPosX:CGFloat = 0
    @State private var isBottomSheet: Bool = false
    let container: DIContainer
    
    public static func bottomSheet<MContent: View>(@ViewBuilder content: () -> MContent) -> some View {
        return content()
    }
    
  
    
    init(container: DIContainer) {
        self.container = container
    }
    
    var contents: some View {
        return ZStack {
            switch router.screen {
            case .first:
                FirstScreen(viewModel: FirstScreen.ViewModel(container: container))
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
                    
                    header
                        .frame(maxWidth: .infinity , maxHeight: 100)
                        .background(Color.headerColor)
                        .onTapGesture {
                            isBottomSheet.toggle()
                        }

                    contents
                        .frame(maxHeight: .infinity)
                        .background(Color.backGroundColor)

                    if ( router.screen == .first || router.screen == .second || router.screen == .third ){
                        footer
                            .frame(maxHeight: 60)
                            .background(Color.backGroundColor)
                    }
                    
                    if ( router.screen == .first || router.screen == .setting || router.screen == .list ){
                        
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
