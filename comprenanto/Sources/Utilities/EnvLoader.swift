import os.log

class EnvLoader {
    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "Environment")

    func loadEnvironment() {
        // Example log
        logger.log("Environment loaded successfully.")
    }
} 