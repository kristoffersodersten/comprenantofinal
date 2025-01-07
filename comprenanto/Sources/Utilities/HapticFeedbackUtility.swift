import UIKit

/// Utility for triggering haptic feedback in the app.
class HapticFeedbackUtility {
    /// Triggers a light impact haptic feedback.
    static func triggerLightImpact() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }

    /// Triggers a medium impact haptic feedback.
    static func triggerMediumImpact() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }

    /// Triggers a heavy impact haptic feedback.
    static func triggerHeavyImpact() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }

    /// Triggers a notification haptic feedback.
    /// - Parameter type: The type of notification feedback (e.g., success, warning, error).
    static func triggerNotification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
} 