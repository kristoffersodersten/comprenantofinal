import SwiftUI

/// The main entry point for the Comprenanto app.
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}

/// The initial landing view displayed when the app launches.
struct LandingView: View {
    var body: some View {
        Text("Welcome to Comprenanto")
            .font(.title)
            .padding()
    }
} 