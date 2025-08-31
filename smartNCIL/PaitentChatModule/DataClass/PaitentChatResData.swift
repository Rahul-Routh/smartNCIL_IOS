import Foundation

// MARK: - News Item
struct ChatList: Codable, Identifiable, Equatable {
    let id = UUID()               // Local ID for SwiftUI List
    let patientId: String?
    let fullName: String?
    let chatCategory: String?
    let sentFrom: String?
    let entryDateTime: String?
    let categoryType: String?
    
    enum CodingKeys: String, CodingKey {
        case patientId = "patient_id"
        case fullName = "full_name"
        case chatCategory = "chat_category"
        case sentFrom = "sent_from"
        case entryDateTime = "entry_date_time"
        case categoryType = "category_type"
    }
}

// MARK: - Response
struct ChatResData: Codable, Equatable {
    let error: Bool           // Bool in your JSON
    let result: ChatResult
}
struct ChatResult: Codable, Equatable {
    let message_list: [ChatList]
}


data class ChatPatientListResponseData(
    @SerializedName("error") var error: Boolean,
    @SerializedName("result") var result: ResultChatPatientList,
)
data class ResultChatPatientList(
    @SerializedName("message_list") var message_list: List<ChatPatientListData>
)
data class ChatPatientListData(
    @SerializedName("patient_id") var patient_id: String,
    @SerializedName("full_name") var full_name: String,
    @SerializedName("chat_category") var chat_category: String,
    @SerializedName("sent_from") var sent_from: String,
    @SerializedName("entry_date_time") var entry_date_time: String,
    @SerializedName("category_type") var category_type: String,
)
