import SwiftUI

struct KeyboardShortcutView: View {
    var body: some View {
        VStack {
            Text("Press Command + N to create a new item")
        }
        .keyboardShortcut("n", modifiers: [.command])
    }
}

struct KeyboardShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardShortcutView()
    }
} 