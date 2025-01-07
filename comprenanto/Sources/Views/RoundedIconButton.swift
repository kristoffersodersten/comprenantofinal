import SwiftUI
import os.log

/// A custom button with a rounded icon design.
struct RoundedIconButton: View {
    /// The name of the icon to display.
    var iconName: String
    
    /// The action to perform when the button is tapped.
    var action: () -> Void

    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "UI")

    // Define constants for layout
    private enum LayoutConstants {
        static let iconSize: CGFloat = 60.0
        static let padding: CGFloat = 16.0
        static let shadowRadius: CGFloat = 5.0
    }

    var body: some View {
        Button(action: {
            logger.log("Rounded icon button tapped.")
            action()
        }) {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: LayoutConstants.iconSize, height: LayoutConstants.iconSize)
                .padding(LayoutConstants.padding)
                .background(Circle().fill(Color.blue))
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.5), radius: LayoutConstants.shadowRadius, x: 0, y: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

/// Preview for the RoundedIconButton.
struct RoundedIconButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedIconButton(iconName: "RecordIcon") {
            print("Button tapped")
        }
    }
} 