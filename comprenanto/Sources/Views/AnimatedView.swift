import SwiftUI

/// A view demonstrating animations and transitions in SwiftUI.
struct AnimatedView: View {
    /// Tracks visibility of the animated text.
    @State private var isVisible = false

    var body: some View {
        VStack {
            if isVisible {
                Text("Hello, World!")
                    .transition(.slide)
                    .animation(.easeInOut(duration: 0.5), value: isVisible)
            }
            Button("Toggle") {
                withAnimation {
                    isVisible.toggle()
                }
            }
        }
        .padding()
    }
}

/// Preview for the AnimatedView.
struct AnimatedView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedView()
    }
} 