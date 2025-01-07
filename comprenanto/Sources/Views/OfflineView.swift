import SwiftUI

/// A view that displays different content based on network connectivity.
struct OfflineView: View {
    /// Monitors the network connectivity status.
    @StateObject private var networkMonitor = NetworkMonitor()

    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                Text("You are online.")
                    .font(.headline)
                    .foregroundColor(.green)
                // Display online content here.
            } else {
                Text("You are offline.")
                    .font(.headline)
                    .foregroundColor(.red)
                // Display offline or cached content here.
            }
        }
        .padding()
    }
}

/// Preview for the OfflineView.
struct OfflineView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineView()
    }
} 