import Foundation

class PowerModeUtility {
    static var isLowPowerModeEnabled: Bool {
        return ProcessInfo.processInfo.isLowPowerModeEnabled
    }
} 