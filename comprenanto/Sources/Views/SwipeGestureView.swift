import SwiftUI

struct SwipeGestureView: View {
    @State private var offset = CGSize.zero

    var body: some View {
        Text("Swipe Me")
            .padding()
            .background(ColorPalette.lightBackground)
            .cornerRadius(10)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        withAnimation {
                            offset = .zero
                        }
                    }
            )
    }
}

struct SwipeGestureView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureView()
    }
} 