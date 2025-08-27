import SwiftUI

struct HomeView: View {
    
    let menuItems = [
            ("attendance_selfie_icons", "Attendance"),
            ("appraisal_icons", "Self Appraisal"),
            ("routine_icons", "Routine"),
            ("leave_icons", "Leave"),
            ("grievance_icons", "Grievance"),
            ("feedback_icons", "Feedback"),
            ("chat_icons", "Chat"),
            ("task_icons", "Task"),
            ("payslip_icons", "Payslip")
        ]
        
        // Grid layout -> 3 equal columns
        let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    
    let menuStudentManagementItems = [
            ("rollcall_icons", "Roll Call"),
            ("marks_entry_icons", "Marks Entry"),
            ("default_image", "Profile"),
        ]
        
        // Grid layout -> 3 equal columns
        let columnsStudentManagement = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    
    var body: some View {
        
        var fullName: String { SessionManager.shared.getUserFullName() ?? "Unknown Name" }
        var designation: String { SessionManager.shared.getUserDesignation() ?? "Unknown Designation" }
        var subject: String { SessionManager.shared.getUserSubjectName() ?? "Unknown Subject" }

        
        NavigationView {
            VStack {
                // Background gradient (gradial_home_top_bar_layout equivalent)
                
                ZStack(alignment: .top) {
                    GradientBackground()
                        .frame(height: 200)
                    
                    VStack(spacing: 4) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 95, height: 95) // outer white border
                                .shadow(radius: 6)
                            
                            Image("profile_icon") // replace with asset name
                                .resizable()
                                .scaledToFill()
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                        }
                        .padding(.bottom, 10)
                        
                        Text(fullName)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(designation)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        Text(subject)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 10)
                }
                
                ScrollView{
                    VStack(spacing: 5) {
                        HStack {
                            Text("Department")
                                .font(.custom("Montserrat-Bold", size: 16))
                                .foregroundColor(Color("ColorText"))
                                .padding(.leading, 20)
                                .padding(.top, 20)
                            Spacer()
                        }
                        VStack() {
                            // Profile Image with CardView effect
                            VStack() {
                                
                                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(menuItems, id: \.1) { item in
                                        VStack(spacing: 6) {
                                            ZStack {
                                                Circle()
                                                    .fill(Color("light_back_blue_back"))
                                                    .frame(width: 80, height: 80)
                                                
                                                Image(item.0)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50)
                                            }
                                            
                                            Text(item.1)
                                                .font(.custom("Montserrat-Regular", size: 12))
                                                .foregroundColor(Color("ColorText"))
                                        }
                                        .onTapGesture {
                                            handleMenuClick(item.1)
                                        }
                                    }
                                }
                                .padding()
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white) // card background
                                    .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
                            )
                            .padding()
                        }
                        
                        
                        VStack() {
                            
                            HStack {
                                Text("Student Management")
                                    .font(.custom("Montserrat-Bold", size: 16))
                                    .foregroundColor(Color("ColorText"))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                Spacer()
                            }
                            // Profile Image with CardView effect
                            VStack() {
                                LazyVGrid(columns: columnsStudentManagement, spacing: 20) {
                                    ForEach(menuStudentManagementItems, id: \.1) { item in
                                        VStack(spacing: 6) {
                                            ZStack {
                                                Circle()
                                                    .fill(Color("light_back_blue_back"))
                                                    .frame(width: 80, height: 80)
                                                
                                                Image(item.0)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50)
                                            }
                                            
                                            Text(item.1)
                                                .font(.custom("Montserrat-Regular", size: 12))
                                                .foregroundColor(Color("ColorText"))
                                        }
                                        .onTapGesture {
                                            handleMenuClick(item.1)
                                        }
                                    }
                                }
                                .padding()
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white) // card background
                                    .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
                            )
                            .padding()
                        }
                    }
                    
                }
                .edgesIgnoringSafeArea(.top)
            }
        }
        
    }
    
    // Handle click function
    func handleMenuClick(_ title: String) {
        switch title {
        case "Attendance":
            print("Attendance clicked")
        case "Self Appraisal":
            print("Self Appraisal clicked")
        case "Routine":
            print("Routine clicked")
        case "Leave":
            print("Leave clicked")
        case "Grievance":
            print("Grievance clicked")
        case "Feedback":
            print("Feedback clicked")
        case "Chat":
            print("Chat clicked")
        case "Task":
            print("Task clicked")
        case "Payslip":
            print("Payslip clicked")
        default:
            break
        }
    }
}
#Preview {
    DashboardView()
}
