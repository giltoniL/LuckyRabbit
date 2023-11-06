//
//  UserSettings.swift
//  LuckyRabbit


import Foundation

class UserSettings {
    
    static let shared = UserSettings()
    private let defaults = UserDefaults.standard

    
    var isNotFirst: Bool {
        get {
            return defaults.bool(forKey: "isNotFirst")
        }
        set {
            defaults.set(newValue, forKey: "isNotFirst")
        }
    }
    
    var lastBonusDate: Date? {
        get {
            return defaults.object(forKey: "lastBonusDate") as? Date
        }
        set {
            defaults.set(newValue, forKey: "lastBonusDate")
        }
    }
    
    var balanceCount: Int {
        
        get {
            return defaults.integer(forKey: "balanceCount")
        }
        set {
            defaults.set(newValue, forKey: "balanceCount")
        }
    }
    
}

