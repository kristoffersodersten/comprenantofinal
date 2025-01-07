import LocalAuthentication

/// Handles biometric authentication for the Comprenanto app.
class BiometricAuthenticator {
    /// Authenticates the user using biometrics.
    /// - Parameter completion: A closure that returns the authentication result and any error encountered.
    func authenticateUser(completion: @escaping (Bool, Error?) -> Void) {
        let context = LAContext()
        var error: NSError?

        // Check if biometric authentication is available on the device.
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Access requires authentication") { success, error in
                completion(success, error)
            }
        } else {
            // Biometric authentication not available.
            completion(false, error)
        }
    }
} 