import Foundation

class EnvLoader {
    static let shared = EnvLoader()

    private init() {
        loadEnvFiles()
    }

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

    private func loadEnvFile(at path: String) {
        guard let fileContents = try? String(contentsOfFile: path, encoding: .utf8) else {
            print("Failed to load .env file at path: \(path)")
            return
        }

        let lines = fileContents.split { $0.isNewline }
        for line in lines {
            let parts = line.split(separator: "=", maxSplits: 1).map { String($0) }
            if parts.count == 2 {
                setenv(parts[0], parts[1], 1)
            }
        }
    }

    func get(_ key: String) -> String? {
        return ProcessInfo.processInfo.environment[key]
    }
}
