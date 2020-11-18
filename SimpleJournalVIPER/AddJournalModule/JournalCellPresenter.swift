//
//  JournalCellPresenter.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 18/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

final class JournalCellPresenter {
    enum FormType {
        case title, detail, date
    }
    
    let title: String
    let titlePlaceholder: String
    let type: FormType
    let date: String = Date().toString()
    
    init(title: String, titlePlaceholder: String, type: FormType) {
        self.title = title
        self.titlePlaceholder = titlePlaceholder
        self.type = type
    }
}
