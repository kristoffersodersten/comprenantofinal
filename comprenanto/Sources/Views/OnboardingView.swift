import SwiftUI

struct OnboardingView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        TabView {
            OnboardingPage(imageName: "feature1", title: "Feature 1", description: "Description of feature 1.")
            OnboardingPage(imageName: "feature2", title: "Feature 2", description: "Description of feature 2.")
            OnboardingPage(imageName: "feature3", title: "Feature 3", description: "Description of feature 3.")
            Button("Get Started") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .buttonStyle(CustomButtonStyle())
            .accessibilityLabel("Get Started Button")
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingPage: View {
    var imageName: String
    var title: String
    var description: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()
                .accessibilityLabel("\(title) Image")

            Text(title)
                .font(.title)
                .padding(.bottom, 8)
                .accessibilityLabel(title)

            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .accessibilityLabel(description)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
} 