//
//  JournalDetailPresenter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 10/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final class JournalDetailPresenter: JournalDetailPresenterProtocol {
    
    var interactor: JournalDetailInteractorProtocol?
    
    var router: JournalDetailRouterProtocol?
    var item: Journal?
    var reload: ((Journal) -> ())?
    
    func viewWillAppear() {
        guard let reload = reload else { fatalError("Reload Function Not Exist") }
        guard let interactor = interactor else { fatalError("Interactor not exist") }
        item = interactor.getJournal()
        guard let item = item else {
            return
        }
        reload(item)
    }
    
    func deleteJournal(from view: UIViewController?) {
        guard let item = item, let view = view else {
            print("item not found")
            return
        }
        interactor?.delete(journal: item)
        router?.navigateBackToViewController(from: view)
    }
    

    
}
