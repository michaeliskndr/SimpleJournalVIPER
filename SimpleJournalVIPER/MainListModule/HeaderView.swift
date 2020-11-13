//
//  HeaderView.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    private let headerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboard not implemented")
    }
    
    func configure(with text: String) {
        headerLabel.text = text
    }
    
    private func setupViews() {
        headerLabel.font = CustomScaleFont.customFont(forStyle: .title2)
        headerLabel.numberOfLines = 0
        headerLabel.adjustsFontForContentSizeCategory = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}


#if DEBUG
import SwiftUI

struct HeaderViewRepresentable: UIViewRepresentable {
        
    func updateUIView(_ uiView: HeaderView, context: Context) {
    }

    func makeUIView(context: Context) -> HeaderView {
        let headerView = HeaderView()
        headerView.configure(with: "Hello World, How Are You?")
        return headerView
    }
}

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        return HeaderViewRepresentable()
    }
}

#endif
