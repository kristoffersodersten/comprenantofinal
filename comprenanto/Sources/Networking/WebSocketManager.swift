import Foundation
import os.log

class WebSocketManager: NSObject {
    private var webSocketTask: URLSessionWebSocketTask?

    func connect() {
        let url = URL(string: "https://your-backend-domain.com/api/endpoint")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(yourJWTToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            if let data = data {
                print("Response: \(String(data: data, encoding: .utf8)!)")
            }
        }
        task.resume()
    }

    func send(message: String) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("WebSocket send error: \(error)")
            }
        }
    }

    private func listenForMessages() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .failure(let error):
                print("WebSocket receive error: \(error)")
            case .success(let message):
                switch message {
                case .string(let text):
                    print("Received text: \(text)")
                default:
                    break
                }
            }
            self?.listenForMessages()
        }
    }

    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}

struct LoginResponse: Codable {
    let token: String
    let expiresIn: Int
} 