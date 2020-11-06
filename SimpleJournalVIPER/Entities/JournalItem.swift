//
//  JournalItem.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 03/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

struct JournalItem: Hashable {

    private let id: Int
    let title: String
    let date: Date
    let detail: String
    let mood: Mood
    
    struct Mood: Hashable {
        let happiness: Double
        let mood: String
    }
    
    init(id: Int, title: String, date: Date, detail: String, mood: Mood) {
        self.id = id
        self.title = title
        self.date = date
        self.detail = detail
        self.mood = mood
    }
    
    
}

extension JournalItem {
    
    static func == (lhs: JournalItem, rhs: JournalItem) -> Bool {
        return lhs.id == rhs.id &&
            lhs.mood.happiness == rhs.mood.happiness
    }
    
    
}
