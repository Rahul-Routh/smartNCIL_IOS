import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color("apps_color"),   // from assets
                Color("apps_color"),
                Color("apps_color2")
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
#Preview {
    GradientBackground()
}
