import Foundation

class SessionManager {
    static let shared = SessionManager()
    private let defaults = UserDefaults.standard
    
    @Published var isLoggedIn: Bool

    private let KEY_USER_ID = "USER_ID"
    private let KEY_USER_FULL_NAME = "USER_FULL_NAME"
    private let KEY_USER_DESIGNATION = "USER_DESIGNATION"
    private let KEY_USER_QUALIFICATION = "USER_QUALIFICATION"
    private let KEY_USER_DEPARTMENT_ID = "USER_DEPARTMENT_ID"
    private let KEY_USER_DEPARTMENT_NAME = "USER_DEPARTMENT_NAME"
    private let KEY_USER_SUBJECT_ID = "USER_SUBJECT_ID"
    private let KEY_USER_SUBJECT_NAME = "USER_SUBJECT_NAME"
    
    
    private let INSTALLATION_ID = "INSTALLATION_ID"

    private init() {
        self.isLoggedIn = defaults.string(forKey: KEY_USER_ID) != nil
            
        // Now you can safely call logout
        if defaults.string(forKey: INSTALLATION_ID) == nil {
            defaults.set(UUID().uuidString, forKey: INSTALLATION_ID)
            logout()
        }
    }

    func loginUser(userId: String, fullName: String, designation: String, qualification: String,
                   departmentid: String, departmentname: String, subjectid: String, subjectname: String ) {
        defaults.set(userId, forKey: KEY_USER_ID)
        defaults.set(fullName, forKey: KEY_USER_FULL_NAME)
        defaults.set(designation, forKey: KEY_USER_DESIGNATION)
        defaults.set(qualification, forKey: KEY_USER_QUALIFICATION)
        defaults.set(departmentid, forKey: KEY_USER_DEPARTMENT_ID)
        defaults.set(departmentname, forKey: KEY_USER_DEPARTMENT_NAME)
        defaults.set(subjectid, forKey: KEY_USER_SUBJECT_ID)
        defaults.set(subjectname, forKey: KEY_USER_SUBJECT_NAME)
        
        isLoggedIn = true // update published property
        
    }
    
    func logout() {
        defaults.removeObject(forKey: KEY_USER_ID)
        defaults.removeObject(forKey: KEY_USER_FULL_NAME)
        defaults.removeObject(forKey: KEY_USER_DESIGNATION)
        defaults.removeObject(forKey: KEY_USER_QUALIFICATION)
        defaults.removeObject(forKey: KEY_USER_DEPARTMENT_ID)
        defaults.removeObject(forKey: KEY_USER_DEPARTMENT_NAME)
        defaults.removeObject(forKey: KEY_USER_SUBJECT_ID)
        defaults.removeObject(forKey: KEY_USER_SUBJECT_NAME)
        
        isLoggedIn = false // update published property
    }
    
    func isLoggedInFunc() -> Bool {
        return defaults.string(forKey: KEY_USER_ID) != nil
    }

    // MARK: - Check
//        func isLoggedIn() -> Bool {
//            return defaults.string(forKey: KEY_USER_ID) != nil
//        }

        // MARK: - Getters
        func getUserId() -> String? {
            return defaults.string(forKey: KEY_USER_ID)
        }

        func getUserFullName() -> String? {
            return defaults.string(forKey: KEY_USER_FULL_NAME)
        }

        func getUserDesignation() -> String? {
            return defaults.string(forKey: KEY_USER_DESIGNATION)
        }

        func getUserQualification() -> String? {
            return defaults.string(forKey: KEY_USER_QUALIFICATION)
        }

        func getUserDepartmentId() -> String? {
            return defaults.string(forKey: KEY_USER_DEPARTMENT_ID)
        }

        func getUserDepartmentName() -> String? {
            return defaults.string(forKey: KEY_USER_DEPARTMENT_NAME)
        }

        func getUserSubjectId() -> String? {
            return defaults.string(forKey: KEY_USER_SUBJECT_ID)
        }

        func getUserSubjectName() -> String? {
            return defaults.string(forKey: KEY_USER_SUBJECT_NAME)
        }

        // MARK: - Installation ID (Device-specific unique ID)
        func getInstallationId() -> String {
            return defaults.string(forKey: INSTALLATION_ID) ?? ""
        }

}

