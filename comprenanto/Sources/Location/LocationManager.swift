import Foundation
import CoreLocation
import os.log

/// Handles location services for the Comprenanto app.
class LocationManager: NSObject, CLLocationManagerDelegate {
    /// Location manager instance.
    private let locationManager: CLLocationManager
    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "Location")

    /// Closure to handle updated locations.
    var onLocationUpdate: ((CLLocation) -> Void)?

    /// Initializes the LocationManager and requests permissions.
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
    }

    /// Starts updating the user's location.
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    /// Stops updating the user's location.
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }

    /// CLLocationManagerDelegate method to handle location updates.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        logger.log("Location updated: \(locations.last?.description ?? "unknown")")
        guard let location = locations.last else { return }
        onLocationUpdate?(location)
    }

    /// CLLocationManagerDelegate method to handle errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location update failed: \(error.localizedDescription)")
    }
} 