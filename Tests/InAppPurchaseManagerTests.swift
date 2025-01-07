import XCTest
@testable import Comprenanto

class InAppPurchaseManagerTests: XCTestCase {
    
    var purchaseManager: InAppPurchaseManager!
    
    override func setUp() {
        super.setUp()
        purchaseManager = InAppPurchaseManager.shared
    }
    
    override func tearDown() {
        purchaseManager = nil
        super.tearDown()
    }
    
    func testFetchProducts() {
        // Mock the SKProductsRequest and its delegate methods
        // Ensure that availableProducts is populated correctly
    }
    
    func testPurchaseProduct() {
        // Mock a product and test the purchase flow
        // Verify that the correct methods are called and the transaction is handled
    }
}