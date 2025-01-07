import SwiftUI

struct ContextMenuView: View {
    @State private var message: String = "Long press for options"

    var body: some View {
        Text(message)
            .padding()
            .contextMenu {
                Button(action: {
                    message = "Option 1 selected"
                }) {
                    Text("Option 1")
                    Image(systemName: "star")
                }

                Button(action: {
                    message = "Option 2 selected"
                }) {
                    Text("Option 2")
                    Image(systemName: "heart")
                }

                Button(action: {
                    message = "Option 3 selected"
                }) {
                    Text("Option 3")
                    Image(systemName: "flag")
                }
            }
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
    }
} 