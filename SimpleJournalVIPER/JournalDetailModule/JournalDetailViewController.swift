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
        
    public var presenter: JournalDetailPresenterProtocol
    
    init(presenter: JournalDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.reload = { [weak self] item in
            self?.configure(with: item)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not Implementing Storyboard")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        presenter.viewWillAppear()
    }

    private func setupViews() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        moodLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        moodLabel.adjustsFontForContentSizeCategory = true
        
        detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        detailLabel.adjustsFontForContentSizeCategory = true
        detailLabel.numberOfLines = 0
        
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        dateLabel.adjustsFontForContentSizeCategory = true
        
        hStack.axis = .horizontal
        hStack.spacing = 8
        
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
        
        view.backgroundColor = .white
        view.addSubview(vStack)
    }
    
    private func configure(with item: JournalItem) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
        dateLabel.text = item.date.toString()
        moodLabel.text = item.mood.mood.emoji
    }
    
    private func setupLayout() {
        let vStackBottomAnchor = vStack.safeAreaLayoutGuide.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            vStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            vStackBottomAnchor,
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    
}

#if DEBUG
import SwiftUI

struct JournalDetailViewControllerRepresentable: UIViewControllerRepresentable {
    
    let item: JournalItem
    
    func updateUIViewController(_ uiViewController: JournalDetailViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> JournalDetailViewController {
        let controller = JournalDetailRouter.createJournalDetailModule(with: item)
        return controller
    }
}


struct JournalDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        return JournalDetailViewControllerRepresentable(item: JournalItem(id: 5, title: "Hello", date: Date(), detail: "hehehehehehehe", mood: .init(happiness: 98.5, mood: .cry)))
    }
}
#endif
