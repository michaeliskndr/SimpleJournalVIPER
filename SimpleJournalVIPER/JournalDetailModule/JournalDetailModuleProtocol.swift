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
    
    var reload: ((JournalItem) -> ())? { get set }
    
    func viewWillAppear()

}

protocol JournalDetailInteractorProtocol {
    
    var journal: JournalItem? { get set }
    
    func getJournal() -> JournalItem
}

protocol JournalDetailRouterProtocol {
    
    static func createJournalDetailModule(with item: JournalItem) -> JournalDetailViewController
    
    func navigateBackToViewController(from view: UIViewController)
}

