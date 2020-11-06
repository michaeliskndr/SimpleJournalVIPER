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
        JournalItem(id: 0, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 1, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 2, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 2, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 3, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern, even though im new. its kinda fun to know new things", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 0, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 1, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 2, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 2, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
        JournalItem(id: 3, title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern, even though im new. its kinda fun to know new things", mood: JournalItem.Mood(happiness: 98.5, mood: "Happy")),
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

