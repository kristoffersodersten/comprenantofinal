import NaturalLanguage

/// Detects the language of a given text.
class LanguageDetector {
    /// Detects the language of the provided text.
    /// - Parameter text: The text to analyze.
    /// - Returns: A language code (e.g., "en" for English) or nil if detection fails.
    func detectLanguage(for text: String) -> String? {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        return recognizer.dominantLanguage?.rawValue
    }

    /// Provides the probability distribution of languages for the given text.
    /// - Parameter text: The text to analyze.
    /// - Returns: A dictionary of language codes and their associated probabilities.
    func languageProbabilities(for text: String) -> [String: Double] {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        let probabilities = recognizer.languageHypotheses(withMaximum: 5)
        return probabilities.reduce(into: [String: Double]()) { result, pair in
            result[pair.key.rawValue] = pair.value
        }
    }
} 