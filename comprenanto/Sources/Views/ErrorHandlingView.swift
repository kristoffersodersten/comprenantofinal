import SwiftUI

struct ErrorHandlingView: View {
    @State private var showError = false

    var body: some View {
        VStack {
            Button("Simulate Error") {
                showError = true
            }
            .alert(isPresented: $showError) {
                Alert(title: Text("Error"), message: Text("Connection lost. Trying to reconnect."), dismissButton: .default(Text("OK")))
            }
        }
    }
} 