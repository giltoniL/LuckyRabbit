//
//  NewsModel.swift
//  LuckyRabbit


import Foundation

struct NewsModel: Codable {
    let id: String
    let title: String
    let content: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content = "body"
        case imageURL
    }
}
