//
//  MainListInteractor.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

final class MainListInteractor: MainListInteractorProtocol {
    
    private let store = JournalStore.shared
    static let shared = MainListInteractor()
    var reload: (() -> ())?
    init() { }
    
    var journals: [Journal] {
        return store.getJournals()
    }
    
    func retrieveJournals() -> [Journal] {
        return journals
    }
    
    func addJournal(_ item: JournalItem) {
        store.save(item)
        guard let reload = reload else {
            print("Reload function is empty")
            return
        }
        reload()
    }
    
    func removeJournal(_ item: Journal) {
        store.delete(item)
        guard let reload = reload else {
            print("Reload function is empty")
            return
        }
        reload()
    }
}
