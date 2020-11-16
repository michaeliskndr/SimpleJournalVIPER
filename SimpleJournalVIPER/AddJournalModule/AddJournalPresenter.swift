//
//  AddJournalPresenter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

final class AddJournalPresenter: AddJournalPresenterProtocol {
    
    var interactor: AddJournalInteractorProtocol?
    
    var router: AddJournalRouterProtocol?
    
    var reload: (() -> ())?
    
    
    
}
