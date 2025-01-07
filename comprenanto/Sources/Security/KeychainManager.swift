import Foundation

/// Manages secure storage of sensitive data using the keychain.
class KeychainManager {
    /// Saves a value to the keychain for a given key.
    /// - Parameters:
    ///   - value: The value to store.
    ///   - key: The key to associate with the value.
    func save(value: String, forKey key: String) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary) // Remove existing item if it exists
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }

    /// Retrieves a value from the keychain for a given key.
    /// - Parameter key: The key to look up.
    /// - Returns: The retrieved value or nil if not found.
    func retrieveValue(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess, let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }

    /// Deletes a value from the keychain for a given key.
    /// - Parameter key: The key to delete.
    /// - Returns: A boolean indicating success.
    func deleteValue(forKey key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
} 