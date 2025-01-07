import Speech

class VoiceControlManager {
    private let speechRecognizer = SFSpeechRecognizer()

    func startListening() {
        if ProcessInfo.processInfo.isLowPowerModeEnabled {
            // Adjust settings for low power mode
            print("Low Power Mode is enabled. Adjusting settings.")
        }
    }
} 