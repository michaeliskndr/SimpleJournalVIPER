//
//  JournalStore.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 03/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

public class JournalStore {
    
    public static let shared = JournalStore()
    private init() { }

    private(set) var journals: [JournalItem] = [
        JournalItem(id: 0, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .happy)),
        JournalItem(id: 1, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .cry)),
        JournalItem(id: 2, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .sad)),
        JournalItem(id: 3, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .cry)),
        JournalItem(id: 4, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern, even though im new. its kinda fun to know new things", mood: JournalItem.Mood(happiness: 98.5, mood: .joy)),
        JournalItem(id: 5, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .sad)),
        JournalItem(id: 6, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .happy)),
        JournalItem(id: 7, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .cry)),
        JournalItem(id: 8, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .sad)),
        JournalItem(id: 9, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern, even though im new. its kinda fun to know new things", mood: JournalItem.Mood(happiness: 98.5, mood: .joy)),
    ]
    
    func addJournal(_ journal: JournalItem) {
        journals.append(journal)
    }
    
    func removeJournal(_ journal: JournalItem) {
        if let index = journals.firstIndex(where: { journalItem in
            journalItem == journal
        }) {
            journals.remove(at: index)
        }
    }
}

