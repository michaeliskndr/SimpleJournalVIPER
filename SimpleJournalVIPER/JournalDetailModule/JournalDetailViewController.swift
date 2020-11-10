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
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let dateLabel = UILabel()
    private let moodImage = UIImageView()
    
    public var journal: JournalItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        
        journal = JournalItem(id: 5, title: "Test", date: Date(), detail: "hehehe", mood: .init(happiness: 99, mood: .happy))
        if let journal = journal {
            configure(with: journal)
        }
    }

    private func setupViews() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        detailLabel.adjustsFontForContentSizeCategory = true
        
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)
        dateLabel.adjustsFontForContentSizeCategory = true
        
        moodImage.contentMode = .scaleAspectFit
        moodImage.backgroundColor = .gray
        moodImage.translatesAutoresizingMaskIntoConstraints = false
        
        vStack.axis = .vertical
        vStack.spacing = 16
        vStack.alignment = .leading
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func configure(with item: JournalItem) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
        dateLabel.text = item.date.toString()
        
    }
    
    private func setupLayout() {
        
    }
}
