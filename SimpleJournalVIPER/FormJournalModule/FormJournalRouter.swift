//
//  AddJournalRouter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final class FormJournalRouter: FormJournalRouterProtocol {
    
    static func createFormJournalModule() -> UIViewController {
        let interactor = FormJournalInteractor()
        interactor.parentInteractor = MainListInteractor.shared
        let presenter = FormJournalPresenter()
        presenter.interactor = interactor
        presenter.router = FormJournalRouter()
        let controller = FormJournalViewController(presenter: presenter)
        return controller
    }
    
    func goBackToMainViewController(from view: UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }
}
