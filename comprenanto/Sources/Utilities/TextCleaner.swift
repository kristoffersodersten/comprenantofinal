import Foundation

/// Utility for cleaning and processing text.
class TextCleaner {
    /// Removes filler words from the given text.
    /// - Parameter text: The text to clean.
    /// - Returns: The cleaned text with filler words removed.
    func removeFillerWords(from text: String) -> String {
        let fillerWords = ["um", "uh", "like", "you know", "basically", "actually"]
        var cleanedText = text
        
        for filler in fillerWords {
            cleanedText = cleanedText.replacingOccurrences(of: "\b\(filler)\b", with: "", options: .regularExpression, range: nil)
        }
        
        return cleanedText.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Normalizes whitespace in the given text.
    /// - Parameter text: The text to normalize.
    /// - Returns: The text with extra whitespace removed.
    func normalizeWhitespace(in text: String) -> String {
        return text.replacingOccurrences(of: "\s+", with: " ", options: .regularExpression, range: nil)
    }

    /// Combines text cleaning operations.
    /// - Parameter text: The raw input text.
    /// - Returns: The fully cleaned and normalized text.
    func cleanText(_ text: String) -> String {
        let withoutFillers = removeFillerWords(from: text)
        return normalizeWhitespace(in: withoutFillers)
    }
} 