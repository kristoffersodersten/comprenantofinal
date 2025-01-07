import SwiftUI
import os.log

/// A view demonstrating the usage of custom UI components.
struct ExampleUsageView: View {
    private let logger = Logger(subsystem: "com.yourapp.Comprenanto", category: "UI")

    var body: some View {
        VStack {
            /// Example of the RoundedIconButton in use.
            RoundedIconButton(iconName: "RecordIcon") {
                logger.log(NSLocalizedString("record_button_tapped", comment: "Log message when record button is tapped"))
            }
        }
        .padding()
    }
}

/// Preview for the ExampleUsageView.
struct ExampleUsageView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleUsageView()
    }
} 