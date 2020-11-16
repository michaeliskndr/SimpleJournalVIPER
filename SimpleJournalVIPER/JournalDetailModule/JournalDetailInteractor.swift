//
//  JournalDetailInteractor.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 10/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

final class JournalDetailInteractor: JournalDetailInteractorProtocol {
    
    var journal: JournalItem?
    
    func getJournal() -> JournalItem {
        return journal ?? JournalItem(id: -1, title: "Not Exist", date: Date(), detail: "Data not found", mood: .init(happiness: 0, mood: .sad))
    }
    
}
