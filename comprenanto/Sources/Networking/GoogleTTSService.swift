import Foundation
import os.log

/// Represents the request structure for Google TTS API.
struct GoogleTTSRequest: Codable {
    let input: [String: String]
    let voice: [String: String]
    let audioConfig: [String: String]
}

/// Represents the response structure from Google TTS API.
struct GoogleTTSResponse: Codable {
    let audioContent: String
}

/// Service for handling text-to-speech using Google TTS API.
class GoogleTTSService {
    let apiKey: String
    let endpoint: String
    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "TTS")

    init(apiKey: String = "YOUR_GOOGLE_API_KEY", endpoint: String = "https://texttospeech.googleapis.com/v1/text:synthesize") {
        self.apiKey = apiKey
        self.endpoint = endpoint
    }

    /// Synthesizes text into speech using Google TTS API.
    /// - Parameters:
    ///   - text: The text to synthesize.
    ///   - completion: A closure that returns the audio data or nil in case of failure.
    func synthesizeText(_ text: String, completion: @escaping (Data?) -> Void) {
        logger.log("Synthesizing text: \(text)")
        guard let url = URL(string: "\(endpoint)?key=\(apiKey)") else {
            logger.error("Invalid URL for Google TTS API.")
            completion(nil)
            return
        }

        let request = GoogleTTSRequest(
            input: ["text": text],
            voice: ["languageCode": "en-US", "name": "en-US-Wavenet-D"],
            audioConfig: ["audioEncoding": "MP3"]
        )

        guard let requestData = try? JSONEncoder().encode(request) else {
            logger.error("Failed to encode request data.")
            completion(nil)
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = requestData

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                self.logger.error("Google TTS error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
} 