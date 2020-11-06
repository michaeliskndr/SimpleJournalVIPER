//
//  MainListInteractor.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

class MainListInteractor: MainListInteractorProtocol {
    
    private let store = JournalStore.shared
    init() { }
    
    var journals: [JournalItem] {
        return store.journals
    }
    
    func retrieveJournals() -> [JournalItem] {
        return journals
    }
    
    func addJournal(_ item: JournalItem) {
        store.addJournal(item)
    }
    
    func removeJournal(_ item: JournalItem) {
        store.removeJournal(item)
    }
}
