import SwiftUI

/// A view modifier for applying a global font style.
struct GlobalFontModifier: ViewModifier {
    /// Font size to apply.
    var size: CGFloat = 12

    /// Applies the custom font to the content.
    /// - Parameter content: The content view to modify.
    /// - Returns: A view with the global font applied.
    func body(content: Content) -> some View {
        content
            .font(.custom("Inter-Regular", size: size))
    }
}

/// Extension to easily apply the global font modifier to any view.
extension View {
    /// Applies the global font style with a specified size.
    /// - Parameter size: The desired font size. Defaults to 12.
    /// - Returns: A view with the global font applied.
    func globalFont(size: CGFloat = 12) -> some View {
        self.modifier(GlobalFontModifier(size: size))
    }
} 