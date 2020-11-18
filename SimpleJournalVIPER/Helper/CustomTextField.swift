//
//  CustomTextField.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 18/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    private let insetX: CGFloat
    private let insetY: CGFloat
    
    init(insetX: CGFloat, insetY: CGFloat) {
        self.insetX = insetX
        self.insetY = insetY
        super.init(frame: .zero)
    }
        
    required init?(coder: NSCoder) {
        fatalError("Failed to initialize UITextField")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: insetX, dy: insetY)
    }
}
