import Foundation
import CommonCrypto

/// Provides methods for encrypting and decrypting data securely.
class DataEncryption {
    /// Encrypts a string using AES encryption.
    /// - Parameters:
    ///   - string: The string to encrypt.
    ///   - key: The encryption key.
    /// - Returns: The encrypted data, or nil if encryption fails.
    func encrypt(string: String, withKey key: String) -> Data? {
        guard let data = string.data(using: .utf8), let keyData = key.data(using: .utf8) else { return nil }
        return performAESOperation(data: data, keyData: keyData, operation: kCCEncrypt)
    }

    /// Decrypts AES-encrypted data to a string.
    /// - Parameters:
    ///   - data: The encrypted data to decrypt.
    ///   - key: The encryption key.
    /// - Returns: The decrypted string, or nil if decryption fails.
    func decrypt(data: Data, withKey key: String) -> String? {
        guard let keyData = key.data(using: .utf8), let decryptedData = performAESOperation(data: data, keyData: keyData, operation: kCCDecrypt) else { return nil }
        return String(data: decryptedData, encoding: .utf8)
    }

    /// Performs AES encryption or decryption.
    /// - Parameters:
    ///   - data: The input data to process.
    ///   - keyData: The key data for encryption/decryption.
    ///   - operation: The AES operation (encrypt or decrypt).
    /// - Returns: The processed data, or nil if the operation fails.
    private func performAESOperation(data: Data, keyData: Data, operation: Int) -> Data? {
        let keyLength = kCCKeySizeAES256
        var cryptData = Data(count: data.count + kCCBlockSizeAES128)
        
        let keyBytes = keyData.withUnsafeBytes { $0.baseAddress! }
        let dataBytes = data.withUnsafeBytes { $0.baseAddress! }
        let cryptBytes = cryptData.withUnsafeMutableBytes { $0.baseAddress! }
        
        var numBytesEncrypted: size_t = 0

        let status = CCCrypt(
            CCOperation(operation),
            CCAlgorithm(kCCAlgorithmAES),
            CCOptions(kCCOptionPKCS7Padding),
            keyBytes, keyLength,
            nil,
            dataBytes, data.count,
            cryptBytes, cryptData.count,
            &numBytesEncrypted
        )

        guard status == kCCSuccess else { return nil }
        cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
        return cryptData
    }
} 