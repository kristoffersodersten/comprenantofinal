import UserNotifications
import os.log

/// Manages push notification permissions and configurations.
class PushNotificationManager {
    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "PushNotification")

    /// Requests permission for push notifications and informs the caller about the result.
    func requestNotificationPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                self.logger.error("Error requesting notification permission: \(error.localizedDescription)")
            }
            
            if granted {
                self.logger.log("Notification permission granted.")
            } else {
                self.logger.log("Notification permission denied.")
                self.provideLocalizedFeedback()
            }
            
            completion(granted)
        }
    }
    
    /// Provides localized feedback to the user when notification permission is denied.
    private func provideLocalizedFeedback() {
        let message = NSLocalizedString("Notification permission denied. Please enable it in settings.", comment: "Feedback message when notification permission is denied")
        // Here you can implement a way to show this message to the user, e.g., using an alert.
        print(message) // Replace with a user-facing alert or notification
    }
} 