import SwiftUI

/// A view that displays the user's current location.
struct LocationView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.userLocation {
                Text("Latitude: \(location.coordinate.latitude)")
                Text("Longitude: \(location.coordinate.longitude)")
            } else {
                Text("Fetching location...")
            }
        }
        .padding()
    }
}

/// Preview for LocationView.
struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
} 