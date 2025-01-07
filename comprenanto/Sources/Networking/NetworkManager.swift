import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchData(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
} 