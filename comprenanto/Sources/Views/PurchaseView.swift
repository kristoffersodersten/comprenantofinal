import SwiftUI

/// A view that handles in-app purchases in the Comprenanto app.
struct PurchaseView: View {
    /// Manages in-app purchases.
    @StateObject private var purchaseManager = InAppPurchaseManager.shared

    var body: some View {
        VStack {
            if let product = purchaseManager.availableProducts.first {
                Button("Subscribe for \(product.localizedPrice)") {
                    purchaseManager.purchase(product: product)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                Text("Loading products...")
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            purchaseManager.fetchProducts()
        }
        .padding()
    }
}

/// Preview for the PurchaseView.
struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
} 