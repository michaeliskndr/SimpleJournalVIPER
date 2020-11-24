//
//  JournalDetailInteractor.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 10/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

final class JournalDetailInteractor: JournalDetailInteractorProtocol {
    
    var journal: Journal
        
    func getJournal() -> Journal {
        return journal
    }
    
    init(journal: Journal) {
        self.journal = journal
    }
}
