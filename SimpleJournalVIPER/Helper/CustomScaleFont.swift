//
//  CustomScaleFont.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

public class CustomScaleFont {
    
    private static let fontDict: [UIFont.TextStyle: UIFont?] = [
        .largeTitle: UIFont(name: "NotoSansJP-Bold", size: 34),
        .title1: UIFont(name: "NotoSansJP-Regular", size: 28),
        .title2: UIFont(name: "NotoSansJP-Regular", size: 22),
        .title3: UIFont(name: "NotoSansJP-Regular", size: 20),
        .headline: UIFont(name: "NotoSansJP-Bold", size: 17),
        .body: UIFont(name: "NotoSansJP-Regular", size: 17),
        .callout: UIFont(name: "NotoSansJP-Regular", size: 16),
        .subheadline: UIFont(name: "NotoSansJP-Regular", size: 15),
        .footnote: UIFont(name: "NotoSansJP-Regular", size: 13),
        .caption1: UIFont(name: "NotoSansJP-Regular", size: 12),
        .caption2: UIFont(name: "NotoSansJP-Regular", size: 11)
        
    ]
    
    public class func customFont(style: UIFont.TextStyle) -> UIFont {
        guard let fontFamily = fontDict[style], let font = fontFamily else {
            fatalError("Font not found in App Resources")
        }
        let fontMetrics = UIFontMetrics(forTextStyle: style)
        return fontMetrics.scaledFont(for: font)
    }
}
