import SwiftUI

/// A view that allows users to switch between light and dark themes.
struct ThemeSwitcherView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isDarkMode = false

    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $isDarkMode)
                .padding()
                .onChange(of: isDarkMode) { value in
                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = value ? .dark : .light
                }

            // Example button with dynamic icon
            Button(action: {
                // Record action
            }) {
                Image(systemName: isDarkMode ? "mic.circle.fill" : "mic.circle")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(isDarkMode ? .white : .black)
                    .padding()
                    .background(Circle().fill(isDarkMode ? Color.black : Color.white))
                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
            }
            .padding()
        }
        .padding()
    }
}

/// Preview for the ThemeSwitcherView.
struct ThemeSwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSwitcherView()
    }
} 