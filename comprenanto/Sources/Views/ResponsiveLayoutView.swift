import SwiftUI

/// A view that adapts its layout based on the horizontal size class.
struct ResponsiveLayoutView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        Group {
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
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

/// Preview for the ResponsiveLayoutView.
struct ResponsiveLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        ResponsiveLayoutView()
            .previewLayout(.fixed(width: 375, height: 812)) // iPhone
        ResponsiveLayoutView()
            .previewLayout(.fixed(width: 834, height: 1112)) // iPad
    }
} 