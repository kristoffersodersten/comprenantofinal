import CoreData

/// Manages Core Data operations for the Comprenanto app.
class CoreDataManager {
    /// Shared instance of the CoreDataManager.
    static let shared = CoreDataManager()

    /// Persistent container for Core Data storage.
    let persistentContainer: NSPersistentContainer

    /// Initializes the Core Data stack.
    init() {
        persistentContainer = NSPersistentContainer(name: "ModelName")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }

    /// Saves changes in the Core Data context.
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
} 