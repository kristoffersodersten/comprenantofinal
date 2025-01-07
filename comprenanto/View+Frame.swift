import SwiftUI

extension View {
    func frame(size: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: size, height: size, alignment: alignment)
    }

    func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        self.frame(width: width, height: height, alignment: alignment)
    }

    func frame(maxWidth: CGFloat? = .infinity, maxHeight: CGFloat? = .infinity, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: alignment)
    }
    
    func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth, minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight, alignment: alignment)
    }
} 