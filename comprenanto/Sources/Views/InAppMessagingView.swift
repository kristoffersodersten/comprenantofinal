import SwiftUI

struct InAppMessagingView: View {
    var message: String

    var body: some View {
        Text(message)
            .padding()
            .background(ColorPalette.lightBackground)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct InAppMessagingView_Previews: PreviewProvider {
    static var previews: some View {
        InAppMessagingView(message: "This is an in-app message.")
    }
} 