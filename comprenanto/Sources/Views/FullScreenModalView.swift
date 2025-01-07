import SwiftUI

/// A view demonstrating the use of a full-screen modal.
struct FullScreenModalView: View {
    /// Tracks whether the modal is presented.
    @State private var isModalPresented = false

    var body: some View {
        VStack {
            Button("Show Full-Screen Modal") {
                isModalPresented.toggle()
            }
            .fullScreenCover(isPresented: $isModalPresented) {
                FullScreenContentView()
            }
        }
    }
}

/// The content displayed within the full-screen modal.
struct FullScreenContentView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Full-Screen Content")
                .font(.largeTitle)
                .padding()

            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.1))
    }
}

/// Preview for the FullScreenModalView.
struct FullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModalView()
    }
} 