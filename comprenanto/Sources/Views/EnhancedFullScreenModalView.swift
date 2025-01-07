import SwiftUI

struct EnhancedFullScreenModalView: View {
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

struct EnhancedFullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        EnhancedFullScreenModalView()
    }
} 