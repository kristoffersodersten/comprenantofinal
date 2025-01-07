import SwiftUI

/// Defines the color palette used in the Comprenanto app.
struct ColorPalette {
    /// Background color for light mode.
    static let lightBackground = Color("CreamWhite") // Define in Assets.xcassets

    /// Background color for dark mode.
    static let darkBackground = Color("DarkGray") // Define in Assets.xcassets

    /// Text color for light mode.
    static let lightText = Color.black

    /// Text color for dark mode.
    static let darkText = Color.white

    /// Border color for UI elements.
    static let border = Color.gray.opacity(0.3)

    /// Background color for buttons.
    static let buttonBackground = Color.blue.opacity(0.8)

    /// Foreground color for button text or icons.
    static let buttonForeground = Color.white
} 