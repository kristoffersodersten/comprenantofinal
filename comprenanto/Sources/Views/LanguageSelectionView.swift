import SwiftUI

/// A view for selecting a preferred language from a list.
struct LanguageSelectionView: View {
    /// The currently selected language.
    @State private var selectedLanguage: String = "en"
    
    /// The list of available languages.
    private let languages = ["en", "fr", "zh", "es", "de"] // Add more languages as needed

    var body: some View {
        VStack {
            Picker("Select Language", selection: $selectedLanguage) {
                ForEach(languages, id: \.self) { language in
                    Text(language).tag(language)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            Text("Selected Language: \(selectedLanguage)")
                .font(.headline)
                .padding(.top)
        }
        .padding()
        .navigationTitle("Language Selection")
    }
}

/// Preview for the LanguageSelectionView.
struct LanguageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectionView()
    }
} 