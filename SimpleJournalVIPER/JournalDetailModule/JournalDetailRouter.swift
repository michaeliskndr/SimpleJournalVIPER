//
//  JournalDetailRouter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 10/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation
import UIKit

final class JournalDetailRouter: JournalDetailRouterProtocol {
    
    static func createJournalDetailModule(with item: Journal) -> JournalDetailViewController {
        let interactor = JournalDetailInteractor(journal: item)
        let presenter = JournalDetailPresenter()
        presenter.interactor = interactor
        presenter.router = JournalDetailRouter()
        
        let controller = JournalDetailViewController(presenter: presenter)
        
        return controller
    }
    
    func navigateBackToViewController(from view: UIViewController) {
        view.navigationController?.popViewController(animated: true)
    }
    
    
}
