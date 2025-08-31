import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color("ColorApp"),   // from assets
                Color("ColorApp"),
                Color("ColorApp2")
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
