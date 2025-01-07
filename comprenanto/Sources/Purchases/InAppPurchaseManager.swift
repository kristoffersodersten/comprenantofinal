import StoreKit
import os.log

/// Manages in-app purchases for the Comprenanto app.
class InAppPurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    /// Shared instance of the InAppPurchaseManager.
    static let shared = InAppPurchaseManager()

    /// The current product request.
    private var productsRequest: SKProductsRequest?
    
    /// List of available products.
    private var availableProducts: [SKProduct] = []

    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "InAppPurchase")

    /// Fetches the list of available in-app purchase products.
    func fetchProducts() {
        logger.log("Fetching in-app purchase products.")
        let productIdentifiers: Set<String> = ["com.example.app.subscription"]
        productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
        productsRequest?.delegate = self
        productsRequest?.start()
    }

    /// Handles the response from the products request.
    /// - Parameters:
    ///   - request: The SKProductsRequest object.
    ///   - response: The SKProductsResponse containing available products.
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        availableProducts = response.products
        // Handle available products, e.g., update UI
    }

    /// Initiates a purchase for the specified product.
    /// - Parameter product: The SKProduct to purchase.
    func purchase(product: SKProduct) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }

    /// Monitors the status of payment transactions.
    /// - Parameters:
    ///   - queue: The payment queue.
    ///   - transactions: Array of SKPaymentTransaction objects.
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                // Handle successful purchase
                print("Purchase successful for product: \(transaction.payment.productIdentifier)")
                SKPaymentQueue.default().finishTransaction(transaction)
            case .failed:
                // Handle failed purchase
                if let error = transaction.error {
                    print("Purchase failed: \(error.localizedDescription)")
                }
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                // Handle restored purchase
                print("Purchase restored for product: \(transaction.payment.productIdentifier)")
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }
} 