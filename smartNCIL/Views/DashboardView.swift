import SwiftUI

struct DashboardView: View {
    @State private var showLogoutDialog = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                
                NoticeView()
                    .tabItem {
                        Image(systemName: "bell.fill")
                        Text("Notice")
                    }
                    .tag(1)
                
                HolidayView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Holiday")
                    }
                    .tag(2)
                
                // Logout tab placeholder
                Text("") // Empty, just a trigger
                    .tabItem {
                        Image(systemName: "power")
                        Text("Logout")
                    }
                    .tag(3)
            }
            .onChange(of: selectedTab) { oldValue, newValue in
                if newValue == 3 { // Logout tab tapped
                    showLogoutDialog = true
                    selectedTab = oldValue // stay on old tab
                }
            }
            .sheet(isPresented: $showLogoutDialog) {
                LogoutDialog(
                    onConfirm: {
                        SessionManager.shared.logout()
                    },
                    onCancel: {
                        showLogoutDialog = false
                    }
                )
                .presentationDetents([.height(300)]) // Bottom sheet height
                .presentationDragIndicator(.visible)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    DashboardView()
}
