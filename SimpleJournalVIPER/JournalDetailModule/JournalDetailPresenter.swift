//
//  JournalDetailPresenter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 10/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

final class JournalDetailPresenter: JournalDetailPresenterProtocol {
    
    var interactor: JournalDetailInteractorProtocol?
    
    var router: JournalDetailRouterProtocol?
    
    var reload: ((Journal) -> ())?
    
    func viewWillAppear() {
        guard let reload = reload else { fatalError("Reload Function Not Exist") }
        guard let interactor = interactor else { fatalError("Interactor not exist") }
        let item = interactor.getJournal()
        reload(item)
    }
    
    
}
