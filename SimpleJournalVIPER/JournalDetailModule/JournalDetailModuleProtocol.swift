//
//  JournalDetailModuleProtocol.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 10/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation
import UIKit

protocol JournalDetailPresenterProtocol {
    
    var interactor: JournalDetailInteractorProtocol? { get set }
    var router: JournalDetailRouterProtocol? { get set }
    
    var reload: ((Journal) -> ())? { get set }
    
    func viewWillAppear()
    func deleteJournal(from: UIViewController?)
}

protocol JournalDetailInteractorProtocol {
    
    var journal: Journal { get set }
    var parentInteractor: MainListInteractorProtocol? { get set }
    func getJournal() -> Journal
    func delete(journal: Journal)
}

protocol JournalDetailRouterProtocol {
    
    static func createJournalDetailModule(with item: Journal) -> JournalDetailViewController
    
    func navigateBackToViewController(from view: UIViewController)
}

