import Foundation

/// Represents a user profile within the Comprenanto app.
struct UserProfile: Codable {
    /// Unique identifier for the user.
    let id: UUID
    
    /// The user's name.
    var name: String
    
    /// The user's preferred language for interactions.
    var preferredLanguage: String
    
    /// Date the user profile was created.
    let creationDate: Date

    /// Initializes a new user profile.
    /// - Parameters:
    ///   - name: The name of the user.
    ///   - preferredLanguage: The user's preferred language.
    init(name: String, preferredLanguage: String) {
        self.id = UUID()
        self.name = name
        self.preferredLanguage = preferredLanguage
        self.creationDate = Date()
    }
} 