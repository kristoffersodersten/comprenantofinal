import SwiftUI

/// Main content view for the Comprenanto app.
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                welcomeText
                navigationLinks
            }
            .padding()
            .navigationTitle("Comprenanto")
        }
    }
    
    /// Welcome text view.
    private var welcomeText: some View {
        Text("Welcome to Comprenanto")
            .font(.largeTitle)
            .padding()
            .accessibilityLabel("Welcome to Comprenanto")
    }
    
    /// Navigation links for app features.
    private var navigationLinks: some View {
        VStack(spacing: 10) {
            navigationButton(title: "Transcription", destination: TranscriptionView(), color: .blue)
            navigationButton(title: "Translation", destination: TranslationView(), color: .green)
        }
    }
    
    /// Creates a navigation button with specified title, destination, and color.
    /// - Parameters:
    ///   - title: The title of the button.
    ///   - destination: The destination view.
    ///   - color: The background color of the button.
    /// - Returns: A view representing the navigation button.
    private func navigationButton<Destination: View>(title: String, destination: Destination, color: Color) -> some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
                .accessibilityLabel("\(title) button")
        }
    }
}

/// Preview provider for ContentView.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}