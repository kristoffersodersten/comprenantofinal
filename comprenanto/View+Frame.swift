import SwiftUI

/// Extensions for setting view frames with flexibility.
extension View {
    /// Sets the view's frame to a specified width and height with optional alignment.
    /// - Parameters:
    ///   - width: The desired width of the view.
    ///   - height: The desired height of the view.
    ///   - alignment: The alignment within the frame. Defaults to `.center`.
    /// - Returns: A view with the specified frame.
    func flexibleFrame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        self.frame(width: width, height: height, alignment: alignment)
    }

    /// Sets the view's maximum frame constraints.
    /// - Parameters:
    ///   - maxWidth: The maximum width of the view.
    ///   - maxHeight: The maximum height of the view.
    ///   - alignment: The alignment within the frame. Defaults to `.center`.
    /// - Returns: A view with the specified maximum frame.
    func constrainedMaxFrame(maxWidth: CGFloat? = .infinity, maxHeight: CGFloat? = .infinity, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: alignment)
    }
} 