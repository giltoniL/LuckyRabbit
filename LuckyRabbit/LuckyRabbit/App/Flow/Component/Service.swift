//
//  Service.swift
//  LuckyRabbit
//


import Foundation

enum ModelsError: Error {
    case unknown
    case noData
}

class Service {
    
    static let shared = Service()
    
    func coctailReadData(successCompletion: @escaping ([CoctailModel]) -> Void, errorComletion: @escaping (Error) -> Void) {
        guard let url = Bundle.main.url(forResource: "dataCoctail", withExtension: nil) else {
            print("Failed to locate  in bundle.")
            errorComletion(ModelsError.unknown)
            
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load  from bundle.")
            errorComletion(ModelsError.noData)
            
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode([CoctailModel].self, from: data)
                successCompletion(model)
                print(model)
        }catch{
            print("error", error)
            errorComletion(error)
        }
    }
    
    func newsReadData(successCompletion: @escaping ([NewsModel]) -> Void, errorComletion: @escaping (Error) -> Void) {
        guard let url = Bundle.main.url(forResource: "dataNews", withExtension: nil) else {
            print("Failed to locate  in bundle.")
            errorComletion(ModelsError.unknown)
            
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load  from bundle.")
            errorComletion(ModelsError.noData)
            
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let modelNews = try decoder.decode([NewsModel].self, from: data)
                successCompletion(modelNews)
                print(modelNews)
        }catch{
            
            print("error", error)
            errorComletion(error)
            
        }
    }
    
}

