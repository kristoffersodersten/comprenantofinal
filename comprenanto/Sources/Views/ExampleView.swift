import SwiftUI

/// A simple example view for testing UI components.
struct ExampleView: View {
    var body: some View {
        VStack {
            Text("Welcome to Comprenanto")
                .font(.title)
                .accessibilityLabel("Welcome to Comprenanto")
                .accessibilityHint("This is the main welcome message")

            Button(action: {
                // Action
            }) {
                Text("Get Started")
            }
            .accessibilityLabel("Get Started Button")
            .accessibilityHint("Tap to begin using the app")
        }
    }
}

/// Preview for the ExampleView in light and dark modes.
struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
            .preferredColorScheme(.light)
        ExampleView()
            .preferredColorScheme(.dark)
    }
} 