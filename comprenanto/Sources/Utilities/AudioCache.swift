import Foundation

class AudioCache {
    static let shared = AudioCache()
    private var cache: [String: Data] = [:]

    private init() {}

    func getAudio(for text: String) -> Data? {
        return cache[text]
    }

    func saveAudio(data: Data, for text: String) {
        cache[text] = data
    }
} 