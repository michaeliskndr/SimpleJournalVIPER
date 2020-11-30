//
//  AddJournalModuleProtocol.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

protocol FormJournalPresenterProtocol {
    
    var interactor: FormJournalInteractorProtocol? { get set }
    var router: FormJournalRouterProtocol? { get set }
    
    var reload: (() -> ())? { get set }
    
    var numberOfRows: Int { get }
    func viewWillAppear()
    func cellForRow(at indexPath: IndexPath) -> JournalCellPresenter
    
}

protocol FormJournalRouterProtocol {
    
    func goBackToMainViewController(from view: UIViewController)
}

protocol FormJournalInteractorProtocol {
    
    var parentInteractor: MainListInteractorProtocol? { get set }
    func addJournal(_ item: JournalItem)
}


