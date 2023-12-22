//
//  NetworkManager.swift
//  LuckyRabbit
//
//  Created by Dmitriy Holovnia on 22.12.2023.
//

import Foundation

enum NetworkError: Error {
    case badRequestc
    case urlError
    case authErorr
}

struct AuthResponse: Codable {
    let token: String
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let username = "admin"
    private let password = "lC2Pg9wg9raXigOZn9Y"
    private let host = "https://rabbitbar.space"
    private var token: String?
    
    private init() {}
    
    func authenticate() async throws {
        guard let url = URL(string: host + "/login") else { throw NetworkError.urlError }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let loginString = "\(username):\(password)"
        if let loginData = loginString.data(using: String.Encoding.utf8) {
            let base64LoginString = loginData.base64EncodedString(options: [])
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        }
        let (data, _) = try await URLSession.shared.data(for: request)
        let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
        self.token = authResponse.token
        print("Token: \(authResponse.token)")
    }
    
    func getNews() async throws -> [NewsModel] {
        guard let token else { throw NetworkError.authErorr }
        guard let url = URL(string: host + "/api/news") else { throw NetworkError.urlError }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let news = try JSONDecoder().decode([NewsModel].self, from: data)
        return news
    }
    
    func getCocktails() async throws -> [CoctailModel] {
        guard let token else { throw NetworkError.authErorr }
        guard let url = URL(string: host + "/api/cocktails") else { throw NetworkError.urlError }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let news = try JSONDecoder().decode([CoctailModel].self, from: data)
        return news
    }
}
