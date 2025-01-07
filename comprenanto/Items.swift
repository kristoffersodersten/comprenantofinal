import Foundation

/// Protocol to define a data model.
protocol Model {}

/// Represents an item in the Comprenanto app.
struct Item: Model, Identifiable, Equatable, Hashable, Codable, CustomStringConvertible {
    /// Unique identifier for the item.
    let id: UUID
    
    /// Name of the item.
    let name: String
    
    /// A textual representation of the item.
    var description: String {
        "Item(id: \(id), name: \(name))"
    }
    
    /// Initializes a new item with a specified name and optional identifier.
    /// - Parameters:
    ///   - name: The name to assign to the item.
    ///   - id: An optional UUID for the item. If not provided, a new UUID is generated.
    init(name: String = "Unnamed Item", id: UUID = UUID()) {
        self.name = Item.validateName(name)
        self.id = id
    }
    
    /// Validates the name, ensuring it is not empty.
    /// - Parameter name: The name to validate.
    /// - Returns: A valid name, defaulting to "Unnamed Item" if the input is empty.
    private static func validateName(_ name: String) -> String {
        return name.isEmpty ? "Unnamed Item" : name
    }
} 