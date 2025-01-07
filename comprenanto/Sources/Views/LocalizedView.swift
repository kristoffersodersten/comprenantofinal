import SwiftUI

/// A view that demonstrates localization with a localized string key.
struct LocalizedView: View {
    var body: some View {
        Text(LocalizedStringKey("welcome_message"))
            .font(.headline)
            .padding()
    }
}

/// Preview for the LocalizedView.
struct LocalizedView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedView()
    }
} 