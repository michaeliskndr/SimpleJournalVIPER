//
//  AddJournalRouter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final class AddJournalRouter: AddJournalRouterProtocol {
    
    static func createAddJournalModule() -> UIViewController {
        let interactor = AddJournalInteractor()
        interactor.parentInteractor = MainListInteractor.shared
        let presenter = AddJournalPresenter()
        presenter.interactor = interactor
        presenter.router = AddJournalRouter()
        let controller = AddJournalViewController(presenter: presenter)
        return controller
    }
    
    func goBackToMainViewController(from view: UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }
}
