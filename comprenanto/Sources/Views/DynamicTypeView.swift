import SwiftUI

/// A view demonstrating text that supports Dynamic Type.
struct DynamicTypeView: View {
    var body: some View {
        Text("This text supports Dynamic Type")
            .font(.body) // Automatically adapts to user settings
    }
}

/// Preview for the DynamicTypeView.
struct DynamicTypeView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTypeView()
    }
} 