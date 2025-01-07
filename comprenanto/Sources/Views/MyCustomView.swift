import SwiftUI

/// A custom view with dynamic content based on the provided ViewModel.
struct MyCustomView: View {
    /// The ViewModel providing data for the view.
    @ObservedObject var viewModel: MyViewModel
    
    /// The main text to display.
    var text: String

    var body: some View {
        VStack {
            Text(text)
                .font(.title)
                .padding()
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            
            if let apiEndpoint = viewModel.apiEndpoint {
                Text("API Endpoint: \(apiEndpoint)")
                    .font(.caption)
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding()
    }
}

/// Preview for MyCustomView.
struct MyCustomView_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomView(text: "Hello, Custom View!", viewModel: MyViewModel())
    }
} 