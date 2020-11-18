//
//  AddJournalModuleProtocol.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

protocol AddJournalPresenterProtocol {
    
    var interactor: AddJournalInteractorProtocol? { get set }
    var router: AddJournalRouterProtocol? { get set }
    
    var reload: (() -> ())? { get set }
    
    var numberOfRows: Int { get }
    func viewWillAppear()
    func cellForRow(at indexPath: IndexPath) -> JournalCellPresenter
    
}

protocol AddJournalRouterProtocol {
    
    func goBackToMainViewController()
}

protocol AddJournalInteractorProtocol {
    
    var journal: JournalItem? { get set }
    func addJournal(_ item: JournalItem)
}


