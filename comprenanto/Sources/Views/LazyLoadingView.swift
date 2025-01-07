import SwiftUI

struct LazyLoadingView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<100) { index in
                    Text("Item \(index)")
                }
            }
        }
    }
}

struct LazyLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LazyLoadingView()
    }
} 