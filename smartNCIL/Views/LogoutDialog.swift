import SwiftUI

struct LogoutDialog: View {
    var onConfirm: () -> Void
    var onCancel: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            
            // 🔹 Icon + Title
            VStack(spacing: 8) {
                Image(systemName: "power.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                
                Text("Logout")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.primary)
            }
            
            // 🔹 Message
            Text("Are you sure you want to logout from the app?")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
            
            // 🔹 Buttons
            HStack(spacing: 16) {
                Button(action: onCancel) {
                    Text("Cancel")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 3)
                }
                
                Button(action: onConfirm) {
                    Text("Yes, Logout")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(
                            LinearGradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.4)],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
                }
            }
            .padding(.top, 10)
        }
        .padding(.horizontal, 20)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}
#Preview {
    LogoutDialog(
        onConfirm: { print("✅ Logout Confirmed") },
        onCancel: { print("❌ Logout Cancelled") }
    )
}
