//
//  MainListRouter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final class MainListRouter: MainListRouterProtocol {
    
    static func createMainListModule() -> UIViewController {
        let interactor = MainListInteractor()
        let presenter = MainListPresenter()
        presenter.interactor = interactor
        presenter.router = MainListRouter()
        let vc = MainListViewController(presenter: presenter)
        
        return vc
    }
    
    //TODO: IMPLEMENT DETAIL VC
    func presentToDetailJournal(from view: UIViewController, item: JournalItem) {
        let detailController = JournalDetailRouter.createJournalDetailModule(with: item)
        view.navigationController?.pushViewController(detailController, animated: true)
        
    }
    
    
}
