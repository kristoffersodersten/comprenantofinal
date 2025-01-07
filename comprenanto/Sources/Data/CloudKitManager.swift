import CloudKit
import os.log

/// Manages CloudKit operations for the Comprenanto app.
class CloudKitManager {
    /// The default CloudKit container.
    let container = CKContainer.default()

    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "CloudKit")

    /// Fetches all records of a specified type from the public CloudKit database.
    /// - Parameters:
    ///   - recordType: The type of records to fetch.
    ///   - completion: A closure that returns the fetched records or an error.
    func fetchRecords(recordType: String, completion: @escaping ([CKRecord]?, Error?) -> Void) {
        logger.log("Fetching records of type: \(recordType)")
        let publicDatabase = container.publicCloudDatabase
        let query = CKQuery(recordType: recordType, predicate: NSPredicate(value: true))
        
        publicDatabase.perform(query, inZoneWith: nil) { records, error in
            if let error = error {
                self.logger.error("Error fetching records: \(error.localizedDescription)")
                // Retry logic or user notification can be added here
                completion(nil, error)
            } else {
                completion(records, nil)
            }
        }
    }

    /// Saves a record to the public CloudKit database.
    /// - Parameters:
    ///   - record: The CKRecord to save.
    ///   - completion: A closure that returns an error if the save operation fails.
    func saveRecord(_ record: CKRecord, completion: @escaping (Error?) -> Void) {
        let publicDatabase = container.publicCloudDatabase
        
        publicDatabase.save(record) { _, error in
            completion(error)
        }
    }
} 