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
        case title, detail, date, mood
    }
    
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    let type: FormType
    private(set) var date: Date = Date()
    private(set) var happiness: Double = 50
    var floatHappiness: Float {
        return Float(happiness)
    }
    var dateString: String {
        return date.toString()
    }
    
    init(title: String, subtitle: String, placeholder: String, type: FormType) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.type = type
    }
    
    func updateText(_ text: String) {
        subtitle = text
    }
    
    func update(_ value: Double) {
        happiness = value
    }
    
    func update(_ value: Date) {
        date = value
    }
}
