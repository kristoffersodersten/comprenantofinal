import SwiftUI

/// A view that displays an optimized, resizable image.
struct OptimizedImageView: View {
    /// The name of the image to display.
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}

/// Preview for the OptimizedImageView.
struct OptimizedImageView_Previews: PreviewProvider {
    static var previews: some View {
        OptimizedImageView(imageName: "example")
    }
} 