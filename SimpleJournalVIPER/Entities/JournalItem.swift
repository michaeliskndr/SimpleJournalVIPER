//
//  JournalItem.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 03/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

struct JournalItem: Hashable {

    private let id = UUID()
    let title: String
    let date: Date
    let detail: String
    let mood: Mood
    
    struct Mood: Hashable {
        enum Mood: String {
            case happy, sad, joy, cry
            
            var emoji: String {
                switch self {
                case .joy: return "😀"
                case .happy: return "😊"
                case .cry: return "😭"
                case .sad: return "😨"
                }
            }
            
            init(value: Double) {
                switch value {
                case 0..<25: self = Mood.cry
                case 25..<50: self = Mood.sad
                case 50..<75: self = Mood.joy
                case 75..<100: self = Mood.happy
                default: self = Mood.joy
                }
            }
        }
        
        let happiness: Double
        let mood: Mood
    }
    
    init(title: String, date: Date, detail: String, mood: Mood) {
        self.title = title
        self.date = date
        self.detail = detail
        self.mood = mood
    }
    
    func uniqueID() -> UUID {
        return id
    }
    
}

extension JournalItem {
    
//    static func == (lhs: JournalItem, rhs: JournalItem) -> Bool {
//        return lhs.id == rhs.id &&
//            lhs.mood.happiness == rhs.mood.happiness
//    }
//
    
}
