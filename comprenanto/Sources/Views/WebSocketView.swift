import SwiftUI

struct WebSocketView: View {
    @StateObject private var webSocketManager = WebSocketManager()

    var body: some View {
        VStack {
            Button("Connect") {
                webSocketManager.connect()
            }
            .padding()

            Button("Send Message") {
                webSocketManager.send(message: "Hello, WebSocket!")
            }
            .padding()

            Button("Disconnect") {
                webSocketManager.disconnect()
            }
            .padding()

            if let errorMessage = webSocketManager.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}

struct WebSocketView_Previews: PreviewProvider {
    static var previews: some View {
        WebSocketView()
    }
} 