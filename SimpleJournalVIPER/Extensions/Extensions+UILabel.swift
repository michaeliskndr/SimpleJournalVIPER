//
//  Extensions+UILabel.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(forTextStyle style: UIFont.TextStyle) {
        self.init(frame: .zero)
        font = CustomScaleFont.customFont(forStyle: style)
        adjustsFontForContentSizeCategory = true
    }
}
