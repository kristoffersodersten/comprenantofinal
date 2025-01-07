import SwiftUI
import os.log

/// The landing page for the Comprenanto app.
struct LandingView: View {
    @Environment(\.colorScheme) var colorScheme
    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "UI")

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                /// Displays the app icon based on the color scheme.
                Image(colorScheme == .dark ? "AppIconDark" : "AppIconLight")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                    .accessibilityLabel("App Icon")

                /// Displays a localized welcome message.
                Text(LocalizedStringKey("welcome_message"))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .accessibilityLabel("Welcome to Comprenanto")

                /// Navigation to the TranscriptionView.
                NavigationLink(destination: TranscriptionView()) {
                    Text(LocalizedStringKey("transcription_button"))
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .accessibilityLabel("Navigate to Transcription")
                }
                .buttonStyle(CustomButtonStyle())

                /// Navigation to the TranslationView.
                NavigationLink(destination: TranslationView()) {
                    Text(LocalizedStringKey("translation_button"))
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .accessibilityLabel("Navigate to Translation")
                }
                .buttonStyle(CustomButtonStyle())

                Spacer()

                RoundedIconButton(iconName: "RecordIcon") {
                    logger.log(NSLocalizedString("record_button_tapped", comment: "Log message when record button is tapped"))
                }
                .padding(.bottom, 20)
                .accessibilityLabel("Record Button")
            }
            .padding()
            .navigationTitle(LocalizedStringKey("comprenanto_title"))
        }
    }
}

/// Preview for the LandingView.
struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .preferredColorScheme(.light)
        LandingView()
            .preferredColorScheme(.dark)
    }
}
