//
//  JournalStore.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 03/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation
import CoreData

protocol JournalStoreProtocol {
    
    func getJournals() -> [Journal]
    func getJournal(at id: NSManagedObjectID) -> Journal?
    func delete(_ item: Journal)
}

public final class JournalStore: JournalStoreProtocol {
    
    public static let shared = JournalStore()
    
    private let coreDataManager = CoreDataManager.shared
    private init() { }
    
    func save(_ item: JournalItem) {
        //TODO: THIS IS ONLY ADD MODEL NOT EDIT
        let journal = Journal(context: coreDataManager.getContext())
        configure(in: journal, with: item)
        coreDataManager.saveContext()
        print("Add Successful")
    }
    
    func getJournals() -> [Journal] {
        coreDataManager.getAll()
    }
    
    func getJournal(at id: NSManagedObjectID) -> Journal? {
        coreDataManager.getItem(at: id)
    }
    
    func delete(_ item: Journal) {
        coreDataManager.delete(item)
        print("Delete successsful")
    }
    
    private func configure(in journal: Journal, with item: JournalItem) {
        journal.id = item.uniqueID()
        journal.title = item.title
        journal.detail = item.detail
        journal.date = item.date
        journal.mood = Mood(context: coreDataManager.getContext())
        journal.mood?.happiness = item.mood.happiness
        journal.mood?.mood = item.mood.mood.emoji
        
    }
}

