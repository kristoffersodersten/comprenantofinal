import Foundation

/// Utility for formatting dates in the Comprenanto app.
class DateFormatterUtility {
    /// Formats a date into a specified string format.
    /// - Parameters:
    ///   - date: The date to format.
    ///   - format: The desired date format (e.g., "yyyy-MM-dd HH:mm:ss").
    /// - Returns: A formatted date string.
    func formatDate(_ date: Date, withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

    /// Parses a date string into a Date object using a specified format.
    /// - Parameters:
    ///   - dateString: The date string to parse.
    ///   - format: The date format to use for parsing.
    /// - Returns: A Date object if parsing is successful, or nil if parsing fails.
    func parseDate(from dateString: String, withFormat format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: dateString)
    }
} 