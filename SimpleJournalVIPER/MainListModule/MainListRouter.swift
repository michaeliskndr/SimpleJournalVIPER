//
//  MainListRouter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final class MainListRouter: MainListRouterProtocol {
    
    private var modalNavigationController: UINavigationController?
    
    static func createMainListModule() -> UIViewController {
        let interactor = MainListInteractor.shared
        let presenter = MainListPresenter()
        presenter.interactor = interactor
        presenter.router = MainListRouter()
        let vc = MainListViewController(presenter: presenter)
        interactor.reload = presenter.reload
        return vc
    }
    
    //TODO: IMPLEMENT DETAIL VC
    func presentToDetailJournal(from view: UIViewController, item: Journal) {
        let detailController = JournalDetailRouter.createJournalDetailModule(with: item)
        view.navigationController?.pushViewController(detailController, animated: true)
        
    }
    
    func presentToAddJournal(from view: UIViewController) {
        let addJournalController = FormJournalRouter.createFormJournalModule()
        modalNavigationController = UINavigationController(rootViewController: addJournalController)
        
        if let modalNavigationController = modalNavigationController {
            view.navigationController?.present(modalNavigationController, animated: true)

        }
    }
    
    
}
