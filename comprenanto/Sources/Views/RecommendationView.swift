import SwiftUI

/// A view that displays personalized recommendations for a user.
struct RecommendationView: View {
    /// The user profile for generating recommendations.
    var userProfile: UserProfile

    var body: some View {
        List {
            ForEach(RecommendationEngine().recommendContent(for: userProfile), id: \.self) { content in
                Text(content)
                    .padding()
            }
        }
        .navigationTitle("Recommendations")
    }
}

/// Preview for the RecommendationView.
struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView(userProfile: UserProfile(name: "Test User", preferredLanguage: "en"))
    }
} 