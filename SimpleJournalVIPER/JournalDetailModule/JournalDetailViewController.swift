//
//  JournalDetailViewController.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 10/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class JournalDetailViewController: UIViewController {

    private let vStack = UIStackView()
    private let hStack = UIStackView()
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let dateLabel = UILabel()
    private let moodLabel = UILabel()
    
    public var journal: JournalItem = JournalItem(id: 5, title: "Hello Tester", date: Date(), detail: "hehehehehehehehehehehe", mood: .init(happiness: 99, mood: .cry))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        configure(with: journal)
    }

    private func setupViews() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        moodLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        moodLabel.adjustsFontForContentSizeCategory = true
        
        detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        detailLabel.adjustsFontForContentSizeCategory = true
        
        dateLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        dateLabel.adjustsFontForContentSizeCategory = true
        
        hStack.axis = .horizontal
        hStack.spacing = 16
        
        hStack.addArrangedSubview(titleLabel)
        hStack.addArrangedSubview(moodLabel)

        vStack.axis = .vertical
        vStack.spacing = 24
        vStack.alignment = .leading
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        vStack.addArrangedSubview(hStack)
        vStack.setCustomSpacing(4, after: hStack)

        vStack.addArrangedSubview(dateLabel)
        vStack.addArrangedSubview(detailLabel)
        
        view.addSubview(vStack)
    }
    
    private func configure(with item: JournalItem) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
        dateLabel.text = item.date.toString()
        moodLabel.text = item.mood.mood.emoji
    }
    
    private func setupLayout() {
        let vStackBottomAnchor = vStack.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            vStackBottomAnchor,
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    
}

#if DEBUG
import SwiftUI

struct JournalDetailViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: JournalDetailViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> JournalDetailViewController{
        let controller = JournalDetailViewController()
        return controller
    }
}


struct JournalDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        return JournalDetailViewControllerRepresentable()
    }
}
#endif
