import Foundation

/// A singleton class responsible for loading environment variables from .env files.
class EnvLoader {
    /// Shared instance of the EnvLoader.
    static let shared = EnvLoader()

    /// Private initializer to prevent direct instantiation.
    private init() {
        loadEnvFiles()
    }

    /// Loads environment variables from predefined .env file paths.
    private func loadEnvFiles() {
        let envPaths = [
            "/Users/kristoffersodersten/Desktop/comprenanto_final/env/backend.env",
            "/Users/kristoffersodersten/Desktop/comprenanto_final/env/middleware.env",
            "/Users/kristoffersodersten/Desktop/comprenanto_final/env/shared.env"
        ]

        for path in envPaths {
            loadEnvFile(at: path)
        }
    }

    /// Reads and sets environment variables from a given .env file.
    /// - Parameter path: The file path to the .env file.
    private func loadEnvFile(at path: String) {
        guard let fileContents = try? String(contentsOfFile: path, encoding: .utf8) else {
            print("Failed to load .env file at path: \(path)")
            return
        }

        let lines = fileContents.split { $0.isNewline }
        for line in lines {
            let parts = line.split(separator: "=", maxSplits: 1).map { String($0).trimmingCharacters(in: .whitespaces) }
            if parts.count == 2 {
                setenv(parts[0], parts[1], 1)
            }
        }
    }

    func get(_ key: String) -> String? {
        return ProcessInfo.processInfo.environment[key]
    }
}
