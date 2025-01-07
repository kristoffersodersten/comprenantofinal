import os.log

class NotificationManager {
    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "Notification")
    private let notificationCenter: UNUserNotificationCenter

    init(notificationCenter: UNUserNotificationCenter = .current()) {
        self.notificationCenter = notificationCenter
    }

    func requestNotificationPermission() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                logger.log("Notification permission granted.")
            } else if let error = error {
                logger.error("Error requesting notification permission: \(error.localizedDescription)")
            }
        }
    }
} 