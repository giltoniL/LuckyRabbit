//
//  CoctailModel.swift
//  LuckyRabbit
//

import Foundation

struct CoctailModel: Decodable {
    
    let id: String
    let credits: Int
    let title: String
    let volume: String
    let score: String
    let ingredients: String
    let image: String
}

