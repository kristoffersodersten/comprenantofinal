import SwiftUI

/// A view demonstrating a context menu with multiple options.
struct EnhancedContextMenuView: View {
    /// The current message displayed based on user interaction.
    @State private var message: String = "Tap and hold for options"

    var body: some View {
        VStack {
            Text(message)
                .padding()
                .contextMenu {
                    Button(action: {
                        message = "Option 1 selected"
                    }) {
                        Label("Option 1", systemImage: "star")
                    }

                    Button(action: {
                        message = "Option 2 selected"
                    }) {
                        Label("Option 2", systemImage: "heart")
                    }

                    Button(action: {
                        message = "Option 3 selected"
                    }) {
                        Label("Option 3", systemImage: "flag")
                    }
                }
        }
        .padding()
    }
}

/// Preview for the EnhancedContextMenuView.
struct EnhancedContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        EnhancedContextMenuView()
    }
} 