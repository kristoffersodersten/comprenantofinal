import SwiftUI

struct SomeView: View {
    var body: some View {
        Button("Track Event") {
            AnalyticsManager.shared.logEvent(name: "button_tapped", parameters: ["button_name": "Track Event"])
        }
    }
}

struct SomeView_Previews: PreviewProvider {
    static var previews: some View {
        SomeView()
    }
} 