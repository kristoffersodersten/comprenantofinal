import SwiftUI

extension View {
    func pinEdges(to view: some View, insets: EdgeInsets = EdgeInsets()) -> some View {
        self
            .padding(insets)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    func pinCenter(to view: some View) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }

    func setSize(width: CGFloat, height: CGFloat) -> some View {
        self
            .frame(width: width, height: height)
    }
} 