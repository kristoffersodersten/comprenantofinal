import SwiftUI

struct AccessibleView: View {
    var body: some View {
        VStack {
            Image(systemName: "star")
                .accessibilityLabel("Favorite")
                .accessibilityHint("Marks this item as a favorite")

            Text("Welcome to the app")
                .accessibilityLabel("Welcome message")
        }
    }
}

struct AccessibleView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibleView()
    }
} 