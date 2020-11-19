//
//  CustomTextField.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 18/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

final public class CustomTextField: UITextField {
    
    private let insetX: CGFloat
    private let insetY: CGFloat
    
    public init(insetX: CGFloat, insetY: CGFloat) {
        self.insetX = insetX
        self.insetY = insetY
        super.init(frame: .zero)
    }
        
    required init?(coder: NSCoder) {
        fatalError("Failed to initialize UITextField")
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: insetX, dy: insetY)
    }
}
