import SwiftUI
import UniformTypeIdentifiers

struct DragDropView: View {
    @State private var items: [String] = ["Item 1", "Item 2", "Item 3"]

    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .onDrag {
                        NSItemProvider(object: item as NSString)
                    }
            }
        }
        .onDrop(of: [UTType.text], isTargeted: nil) { providers in
            providers.first?.loadObject(ofClass: String.self) { (item, error) in
                if let item = item {
                    DispatchQueue.main.async {
                        self.items.append(item)
                    }
                }
            }
            return true
        }
    }
}

struct DragDropView_Previews: PreviewProvider {
    static var previews: some View {
        DragDropView()
    }
} 