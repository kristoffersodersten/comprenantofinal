import SwiftUI

/// A custom button style for the Comprenanto app.
struct CustomButtonStyle: ButtonStyle {
    /// Background color of the button.
    var backgroundColor: Color = Color.blue
    
    /// Foreground color of the button text or content.
    var foregroundColor: Color = Color.white

    /// Creates the button's body.
    /// - Parameter configuration: The current state and content of the button.
    /// - Returns: A view representing the styled button.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .clipShape(Capsule())
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
} 