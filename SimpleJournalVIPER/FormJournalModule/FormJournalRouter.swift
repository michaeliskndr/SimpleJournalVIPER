//
//  AddJournalRouter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final class FormJournalRouter: FormJournalRouterProtocol {
    
    static func createAddJournalFormModule() -> UIViewController {
        let interactor = FormJournalInteractor()
        //MARK: IS THIS A GOOD THING TO DO?
        //MARK: HOW TO TELL ANOTHER MODULE TO REFRESH ON ITS OWN?
        interactor.parentInteractor = MainListInteractor.shared
        let presenter = FormJournalPresenter()
        presenter.interactor = interactor
        presenter.router = FormJournalRouter()
        let controller = FormJournalViewController(presenter: presenter)
        return controller
    }
    
    static func createEditFormJournalModule(with item: Journal) -> UIViewController {
        let interactor = FormJournalInteractor()
        interactor.journal = item
        //MARK: IS THIS A GOOD THING TO DO?
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
