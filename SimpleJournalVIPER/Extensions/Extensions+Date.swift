//
//  Extensions+Date.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 10/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
}
