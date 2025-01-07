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

class WebSocketManager {
    private var webSocketTask: URLSessionWebSocketTask?
    
    func connect() {
        guard let url = URL(string: "ws://localhost:8000/ws") else { return }
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()
        receiveMessages()
    }
    
    func send(message: String) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("WebSocket send error: \(error)")
            }
        }
    }
    
    private func receiveMessages() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    print("Received text: \(text)")
                case .data(let data):
                    print("Received data: \(data)")
                default:
                    break
                }
                self?.receiveMessages()
            case .failure(let error):
                print("WebSocket receive error: \(error)")
            }
        }
    }
}

struct APIClient {
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8000/items") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let items = try JSONDecoder().decode([Item].self, from: data)
                completion(.success(items))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

class EnergyEfficientManager {
    private var isLowPowerModeEnabled: Bool {
        return ProcessInfo.processInfo.isLowPowerModeEnabled
    }

    func adjustPollingFrequency() {
        if isLowPowerModeEnabled {
            // Reduce polling frequency
            print("Low Power Mode is enabled. Reducing polling frequency.")
        } else {
            // Normal polling frequency
            print("Low Power Mode is not enabled. Using normal polling frequency.")
        }
    }
}
