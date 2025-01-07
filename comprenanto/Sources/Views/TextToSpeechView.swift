import SwiftUI
import AVFoundation

/// A view for synthesizing and playing text-to-speech audio.
struct TextToSpeechView: View {
    /// The text to be synthesized into speech.
    @State private var textToSynthesize: String = "Hello, welcome to Comprenanto!"
    
    /// Indicates whether the synthesis process is loading.
    @State private var isLoading: Bool = false

    /// The audio player for playing the synthesized audio.
    private let audioPlayer = AudioPlayer()

    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "TTS")

    private let speechSynthesizer = AVSpeechSynthesizer()

    @State private var selectedVoice: AVSpeechSynthesisVoice?
    @State private var isSpeaking: Bool = false

    private let voices = AVSpeechSynthesisVoice.speechVoices().filter { $0.quality == .enhanced }

    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)

    @State private var showError: Bool = false
    @State private var errorMessage: String = ""

    @State private var isDownloading: Bool = false

    @State private var selectedLanguage: String = "en-US"

    var body: some View {
        VStack {
            TextField("Enter text to synthesize", text: $textToSynthesize)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)

            Picker("Select Voice", selection: $selectedVoice) {
                ForEach(voices, id: \.self) { voice in
                    Text(voice.name).tag(voice as AVSpeechSynthesisVoice?)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            Button(isSpeaking ? "Stop" : "Speak") {
                feedbackGenerator.impactOccurred()
                isSpeaking ? stopSpeaking() : speakText(textToSynthesize)
            }
            .padding()
            .disabled(textToSynthesize.isEmpty)

            if isLoading {
                ProgressView("Processing...")
                    .padding()
            }

            Image(systemName: "mic.fill")
                .scaleEffect(isSpeaking ? 1.2 : 1.0)
                .foregroundColor(isSpeaking ? .red : .blue)
                .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isSpeaking)
        }
        .padding()
        .navigationTitle("Text-to-Speech")
        .onAppear {
            speechSynthesizer.delegate = self
            selectedVoice = voices.first
            downloadEnhancedVoicesIfNeeded()
            fetchLanguage()
        }
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    /// Synthesizes and speaks the given text using Apple's TTS.
    private func speakText(_ text: String) {
        isLoading = true
        let utterance = AVSpeechUtterance(string: text)
        if let voice = bestAvailableVoice(for: Locale.current.languageCode ?? "en-US") {
            utterance.voice = voice
        }
        speechSynthesizer.speak(utterance)
        isSpeaking = true
        isLoading = false
    }

    /// Stops the current speech.
    private func stopSpeaking() {
        speechSynthesizer.stopSpeaking(at: .immediate)
        isSpeaking = false
    }

    private func fetchLanguage() {
        BackendManager.shared.fetchData(endpoint: "getLanguage") { result in
            switch result {
            case .success(let data):
                if let language = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.selectedLanguage = language
                    }
                }
            case .failure(let error):
                print("Error fetching language: \(error)")
            }
        }
    }

    private func showError(with message: String) {
        errorMessage = message
        showError = true
    }

    private func downloadEnhancedVoicesIfNeeded() {
        for voice in AVSpeechSynthesisVoice.speechVoices() {
            if voice.quality == .enhanced && !voice.isDownloadable {
                print("Downloading voice: \(voice.name) (\(voice.language))")
                AVSpeechSynthesisVoice.downloadVoice(voice) { success in
                    if success {
                        print("Successfully downloaded: \(voice.name)")
                    } else {
                        print("Failed to download: \(voice.name)")
                    }
                }
            }
        }
    }

    private func downloadEnhancedVoice(_ voice: AVSpeechSynthesisVoice) {
        isDownloading = true
        AVSpeechSynthesisVoice.downloadVoice(voice) { success in
            DispatchQueue.main.async {
                isDownloading = false
                if success {
                    print("\(voice.name) downloaded successfully")
                } else {
                    showError(with: "Failed to download \(voice.name)")
                }
            }
        }
    }

    private func bestAvailableVoice(for language: String) -> AVSpeechSynthesisVoice? {
        let voices = AVSpeechSynthesisVoice.speechVoices().filter { $0.language == language }
        return voices.first(where: { $0.quality == .enhanced }) ?? voices.first
    }
}

extension TextToSpeechView: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        isSpeaking = true
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        isSpeaking = false
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        isSpeaking = false
    }
}

/// Preview for the TextToSpeechView.
struct TextToSpeechView_Previews: PreviewProvider {
    static var previews: some View {
        TextToSpeechView()
    }
} 