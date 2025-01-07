import Foundation
import BackgroundTasks
import os.log
import SwiftUI
import AVFoundation
import UniformTypeIdentifiers

/// Manages background tasks for the Comprenanto app.
class BackgroundTaskManager {
    /// Singleton instance of the background task manager.
    static let shared = BackgroundTaskManager()

    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "BackgroundTask")

    /// Private initializer to enforce singleton usage.
    private init() {
        registerBackgroundTasks()
    }

    /// Registers the app's background tasks with the system.
    private func registerBackgroundTasks() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.comprenanto.refresh", using: nil) { task in
            Task {
                await self.handleAppRefresh(task: task as? BGAppRefreshTask)
            }
        }

        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.comprenanto.processing", using: nil) { task in
            Task {
                await self.handleProcessingTask(task: task as? BGProcessingTask)
            }
        }
    }

    /// Schedules an app refresh background task.
    func scheduleAppRefresh() {
        logger.log("Scheduling app refresh task.")
        let request = BGAppRefreshTaskRequest(identifier: "com.comprenanto.refresh")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60) // 15 minutes from now

        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Failed to schedule app refresh: \(error.localizedDescription)")
        }
    }

    /// Handles the app refresh background task.
    /// - Parameter task: The background app refresh task.
    private func handleAppRefresh(task: BGAppRefreshTask?) async {
        guard let task = task else {
            logger.error("Failed to cast task to BGAppRefreshTask.")
            return
        }
        // Perform refresh operations asynchronously
        logger.log("Handling app refresh task.")
        task.setTaskCompleted(success: true)
    }

    /// Handles the processing background task.
    /// - Parameter task: The background processing task.
    private func handleProcessingTask(task: BGProcessingTask?) async {
        guard let task = task else {
            logger.error("Failed to cast task to BGProcessingTask.")
            return
        }
        // Perform processing operations asynchronously
        logger.log("Handling processing task.")
        task.setTaskCompleted(success: true)
    }
} 