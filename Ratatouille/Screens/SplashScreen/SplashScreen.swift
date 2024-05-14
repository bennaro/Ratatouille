
import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var rotation = -90.0
    @State private var offsetY: CGFloat = -400
    
    var body: some View {
        if isActive {
            TabBarView()
        } else {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Image("ratatouille.splash.rat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .rotationEffect(Angle(degrees: rotation))
                        .onAppear {
                            withAnimation(Animation.bouncy(duration: 2.0)) {
                                self.rotation = 360
                            }
                        }
                
                    Image("ratatouille.splash.hat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .offset(x: 15)
                        .offset(y: offsetY)
                        .onAppear {
                            withAnimation(Animation.spring(duration: 2.0)) {
                                self.offsetY = -190
                            }
                        }
                    
                    Text("Loading...")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                }
                
            }
            // Delayed transition to the next screen
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
