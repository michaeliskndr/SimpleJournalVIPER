//
//  MainListPresenter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final class MainListPresenter: MainListPresenterProtocol {

    var router: MainListRouterProtocol?
    var interactor: MainListInteractorProtocol?
    
    var reload: (() -> ())?

    private var journals: [JournalItem] {
        return interactor?.retrieveJournals() ?? []
    }
    
    var numberOfItems: Int {
        return journals.count
    }
    
    func viewWillAppear() {
        guard let reload = reload else {
            fatalError("Reload Function not loaded with function yet")
        }
        reload()
    }
    
    func itemForRow(_ indexPath: IndexPath) -> JournalItem {
        journals[indexPath.item]
    }
    
    func goToDetail(from view: UIViewController, at indexPath: IndexPath) {
        guard let router = router else { fatalError("Router Doesnt Exist") }
        
        let item = journals[indexPath.item]
        router.presentToDetailJournal(from: view, item: item)
    }
    
}
