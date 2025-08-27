import Foundation

class APIClient {
    static let shared = APIClient()
    private init() {}

    // MARK: - GET
    func get<T: Decodable>(
        endpoint: String,
        queryParams: [String: String]? = nil,
        responseType: T.Type
    ) async throws -> T {
        var urlComponents = URLComponents(string: API.baseURL + endpoint)!
        if let queryParams = queryParams {
            urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(responseType, from: data)
    }

    // MARK: - POST JSON
    func postJSON<T: Decodable>(
        endpoint: String,
        body: [String: Any],
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: API.baseURL + endpoint) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(responseType, from: data)
    }

    // MARK: - POST FormURLEncoded
    func postFormURLEncoded<T: Decodable>(
        endpoint: String,
        parameters: [String: String],
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: API.baseURL + endpoint) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let bodyString = parameters.map { "\($0.key)=\($0.value)" }
                                   .joined(separator: "&")
        request.httpBody = bodyString.data(using: .utf8)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(responseType, from: data)
    }
}
