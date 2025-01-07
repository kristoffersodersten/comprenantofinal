import Foundation
import CoreLocation

/// Manages language suggestions based on the user's location.
class LanguageSuggestionManager: NSObject, CLLocationManagerDelegate {
    /// Location manager instance to track user's location.
    private let locationManager = CLLocationManager()

    /// Closure to handle suggested language updates.
    var onLanguageSuggested: ((String) -> Void)?

    /// Initializes the manager and requests location permissions.
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    /// Starts updating the user's location to provide language suggestions.
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    /// Stops updating the user's location.
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }

    /// CLLocationManagerDelegate method to handle location updates.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        // Example: Suggest language based on country code
        CLGeocoder().reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let countryCode = placemarks?.first?.isoCountryCode else { return }
            let suggestedLanguage = self?.languageForCountryCode(countryCode) ?? "en"
            self?.onLanguageSuggested?(suggestedLanguage)
        }
    }

    /// Maps a country code to a language code.
    /// - Parameter countryCode: The ISO country code.
    /// - Returns: A suggested language code.
    private func languageForCountryCode(_ countryCode: String) -> String {
        switch countryCode {
        case "SE": return "sv"
        case "FR": return "fr"
        case "DE": return "de"
        default: return "en"
        }
    }

    /// CLLocationManagerDelegate method to handle errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to update location: \(error.localizedDescription)")
    }
} 