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
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .happy)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .cry)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .happy)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .cry)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .happy)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .cry)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .happy)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .cry)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .happy)),
        JournalItem(title: "Today is the day", date: Date(), detail: "I have fun playing with VIPER design pattern", mood: JournalItem.Mood(happiness: 98.5, mood: .cry))
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

