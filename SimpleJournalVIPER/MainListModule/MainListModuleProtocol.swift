//
//  MainListModuleProtocol.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

protocol MainListPresenterProtocol {
    
    var router: MainListRouterProtocol? { get set }
    var interactor: MainListInteractorProtocol? { get set }
    
    var reload: (() -> ())? { get set }
    
    var numberOfItems: Int { get }
    func viewWillAppear()
    func itemForRow(_ indexPath: IndexPath) -> JournalItem
    func goToDetail(from view: UIViewController, at indexPath: IndexPath)
    func goToAddJournal(from view: UIViewController)
}

protocol MainListRouterProtocol {
    
    static func createMainListModule() -> UIViewController
    
    func presentToDetailJournal(from view: UIViewController, item: JournalItem)
    func presentToAddJournal(from view: UIViewController)
}

protocol MainListInteractorProtocol {
    
    func addJournal(_ item: JournalItem)
    func removeJournal(_ item: JournalItem)
    func retrieveJournals() -> [JournalItem]
    
}
