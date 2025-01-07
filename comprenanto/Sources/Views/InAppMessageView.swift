import SwiftUI

/// A view that displays an in-app message.
struct InAppMessageView: View {
    /// The message to display.
    var message: String

    var body: some View {
        Text(message)
            .padding()
            .background(ColorPalette.lightBackground)
            .cornerRadius(10)
            .shadow(radius: 5)
            .multilineTextAlignment(.center)
    }
}

/// Preview for the InAppMessageView.
struct InAppMessageView_Previews: PreviewProvider {
    static var previews: some View {
        InAppMessageView(message: "This is a sample in-app message.")
            .previewLayout(.sizeThatFits)
            .padding()
    }
} 