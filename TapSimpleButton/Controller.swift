
import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Controller()
    }
}

struct Controller: ScreenMovable {
    
    @EnvironmentObject var router : Router
    @EnvironmentObject var info : HeaderInfo

    @State private var labelPosX:CGFloat = 0

    var contents: some View {
        return ZStack {
            switch router.screen {
            case .first:
                FirstScreen()
            case .second:
                SecondScreen()
            case .third:
                ThirdScreen()
            }
        }
    }

    var body: some View {
        
        VStack(spacing: 0) {
            
            header
                .frame(maxWidth: .infinity , maxHeight: 100)
                .background(Color.headerColor)
            
            contents
                .frame(maxHeight: .infinity)
            
            footer
                .frame(maxHeight: 60)
            
            if router.screen == .first {
                bottomMenu
            }
        }
        .background(Color.backGroundColor)
    }
}

extension View {
    func setTransAnimation(direction: Router.Direction = .forward) -> some View {
        if  case .back = direction {
            return self
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
        } else {
            return self
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
    }
}


