import SwiftUI

/// A view that adapts its layout based on the device's size class.
struct AdaptiveLayoutView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        if sizeClass == .compact {
            VStack {
                Text("Compact Layout")
            }
        } else {
            HStack {
                Text("Regular Layout")
            }
        }
    }
}

/// Preview for AdaptiveLayoutView.
struct AdaptiveLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdaptiveLayoutView()
                .previewLayout(.fixed(width: 375, height: 812)) // iPhone layout
            AdaptiveLayoutView()
                .previewLayout(.fixed(width: 1024, height: 768)) // iPad layout
        }
    }
} 