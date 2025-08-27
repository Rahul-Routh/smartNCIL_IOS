import Foundation

enum API {
    //static let baseURL = "https://edudev.in/api/" // Live URL
    static let baseURL = "https://onlinescw.in/api/" //

    enum Endpoints {
        static let TERMS_CONDITION = "https://onlinerksmvv.in/terms.php"
        static let PRIVACY_POLICY = "https://onlinerksmvv.in/privacyPolicy.php"
        
        // Authentication
        static let LOGIN_API = "clgfacultyapi/login.php"
        
        // Profile
        static let PROFILE_API = "clgfacultyapi/faculty_profile.php"
        static let PROFILE_UPDATE_API = "clgfacultyapi/update_faculty_profile.php"
        
        // Location
        static let COUNTRY_API = "clgfacultyapi/getcountry.php"
        static let STATE_API = "clgfacultyapi/getstate.php"
        static let DISTRICT_API = "clgfacultyapi/getdistrict.php"
        
        // Holiday
        static let HOLIDAY_LIST_API = "clgfacultyapi/holiday_list.php"
        
        // Notice and News
        static let NEWS_LIST_API = "clgfacultyapi/getnews.php"
        
        // Grievance
        static let GRIEVANCE_TYPE_API = "clgfacultyapi/grievance_type.php"
        static let ADD_GRIEVANCE_API = "clgfacultyapi/addgrievance.php"
        static let GRIEVANCE_LIST_API = "clgfacultyapi/grievance.php"
        
        // Self Appraisal
        static let SELF_APPRAISAL_LIST_API = "clgfacultyapi/self_appraisal_list.php"
        static let SELF_APPRAISAL_LIST_SEARCH_API = "clgfacultyapi/search_appraisal_list.php"
        static let ADD_SELF_APPRAISAL_API = "clgfacultyapi/self_appraisal_insert.php"
        
        // Roll Call
        static let COMMON_TYPE_API = "clgfacultyapi/common_type.php"
        // static let SUBJECT_LIST_API = "clgfacultyapi/subject_list.php"
        static let SECTION_LIST_API = "clgfacultyapi/section_list.php"
        // static let STUDENT_LIST_API = "clgfacultyapi/student_list_subject_wise.php"
        static let STUDENT_LIST_API = "clgfacultyapi/rollcall_list.php"
        static let ROLL_CALL_INSERT_API = "clgfacultyapi/rollcall_insert.php"
        
        // Routine
        static let ROUTINE_LIST_API = "clgfacultyapi/employee_routine_list.php"
        
        // Feedback
        static let FEEDBACK_QS_API = "clgfacultyapi/feedback_question_list.php"
        static let FEEDBACK_SCHEDULE_API = "clgfacultyapi/feedback_schedule.php"
        static let ADD_FEEDBACK_API = "clgfacultyapi/feedback_insert.php"
        
        // Attendance
        static let ATTENDANCE_CHECK_API = "clgfacultyapi/check_employee_attendance_status.php"
        static let ATTENDANCE_LIST_API = "clgfacultyapi/employee_attendance_list.php"
        static let ATTENDANCE_ADD_API = "clgfacultyapi/employee_attendance.php"
        
        // Student Profile
        static let STUDENT_PROFILE_LIST_API = "clgfacultyapi/student_profile_search.php"
        static let STUDENT_PROFILE_DETAILS_API = "clgfacultyapi/student_profile_details.php"
        
        // Chat
        static let EMPLOYEE_LIST_API = "clgfacultyapi/all_employee_list.php"
        
        // Task
        static let TASK_USER_LIST_API = "clgfacultyapi/task_user_list.php"
        static let TASK_PRIORITY_API = "clgfacultyapi/task_priority.php"
        static let TASK_CATEGORY_API = "clgfacultyapi/task_category.php"
        static let TASK_MY_LIST_API = "clgfacultyapi/task_my_list.php"
        static let TASK_ASSIGNMENT_INSERT_API = "clgfacultyapi/task_assignment_insert.php"
        
        // Privacy Policy (API Version)
        static let PRIVACY_POLICY_API = "clgfacultyapi/privacy_policy.php"
    }
}
