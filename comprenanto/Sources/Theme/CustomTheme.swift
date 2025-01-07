import SwiftUI

/// Defines the custom theme used throughout the Comprenanto app.
struct CustomTheme {
    /// Light gradient theme for light mode.
    static let gradientLight = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color.gray]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    /// Dark gradient theme for dark mode.
    static let gradientDark = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.gray]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    /// Default corner radius for UI elements.
    static let cornerRadius: CGFloat = 10

    /// Returns the appropriate gradient based on the current color scheme.
    /// - Parameter colorScheme: The current color scheme (light or dark).
    /// - Returns: A LinearGradient for the specified color scheme.
    static func gradient(for colorScheme: ColorScheme) -> LinearGradient {
        return colorScheme == .dark ? gradientDark : gradientLight
    }

    /// Default font used in the app.
    static let font = Font.system(size: 18, weight: .regular, design: .default)
} 