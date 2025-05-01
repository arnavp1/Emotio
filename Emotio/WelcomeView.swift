import SwiftUI

struct WelcomeView: View {
    @State private var emojiOffset: CGFloat = -300
    @State private var emojiScale: CGFloat = 0.8
    @State private var isNavigating = false
    @State private var navigate = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow, Color.orange]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                Text("Emotio")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(.white)

                Text("🤔")
                    .font(.system(size: 100))
                    .scaleEffect(emojiScale)
                    .offset(y: emojiOffset)
                    .animation(.interpolatingSpring(stiffness: 120, damping: 10), value: emojiOffset)
                    .animation(.easeInOut(duration: 0.3), value: emojiScale)

                Spacer()

                Button {
                    isNavigating = true
                    emojiOffset = -600
                    emojiScale = 1.2
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        navigate = true
                    }
                } label: {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.orange)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding()
            .onAppear {
                withAnimation {
                    emojiOffset = 0
                }
                withAnimation(
                    .easeInOut(duration: 0.25)
                        .repeatCount(2, autoreverses: true)
                        .delay(0.3)
                ) {
                    emojiScale = 1.1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    emojiScale = 1.0
                }
            }

            .navigationDestination(isPresented: $navigate) {
                MainView()
            }
        }
    }
}
