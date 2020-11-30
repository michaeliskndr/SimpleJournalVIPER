//
//  AddJournalInteractor.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

final class FormJournalInteractor: FormJournalInteractorProtocol {
    
    var journal: Journal?
    var parentInteractor: (MainListInteractorProtocol)?
    
    func addJournal(_ item: JournalItem) {
        parentInteractor?.addJournal(item)
    }
    
}
