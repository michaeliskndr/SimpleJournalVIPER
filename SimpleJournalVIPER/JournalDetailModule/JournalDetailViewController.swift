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
    private let titleLabel = UILabel(forTextStyle: .title1)
    private let moodLabel = UILabel(forTextStyle: .title1)
    private let dateLabel = UILabel(forTextStyle: .caption1)
    private let detailLabel = UILabel(forTextStyle: .body)
    private let scrollView = UIScrollView(frame: .zero)
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
        detailLabel.numberOfLines = 0
        
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(deleteTapped)
        )
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.offWhite
        scrollView.alwaysBounceVertical = true
        scrollView.addSubview(vStack)
        view.addSubview(scrollView)
    }
    
    
    private func configure(with item: Journal) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
        dateLabel.text = item.date?.toString()
        moodLabel.text = item.mood?.mood
    }
    
    private func setupLayout() {
        let frameGuide = scrollView.frameLayoutGuide
        let contentGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            frameGuide.topAnchor.constraint(equalTo: view.topAnchor),
            frameGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            frameGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vStack.leadingAnchor.constraint(equalTo: contentGuide.leadingAnchor, constant: 16),
            vStack.topAnchor.constraint(equalTo: contentGuide.topAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: contentGuide.trailingAnchor, constant: -16),
            vStack.bottomAnchor.constraint(equalTo: contentGuide.bottomAnchor,constant: -16),
            contentGuide.widthAnchor.constraint(equalTo: frameGuide.widthAnchor)
        ])
    }
    
    @objc func deleteTapped(sender: UIBarButtonItem) {
        let ac = UIAlertController(
            title: "Are You Sure",
            message: "This journal entry will be deleted",
            preferredStyle: .alert)
        ac.addAction(
            UIAlertAction(
                title: "Delete",
                style: .destructive,
                handler: { [weak self] (_) in
                    self?.presenter.deleteJournal(from: self)
                }
            )
        )
        ac.addAction(
            UIAlertAction(
                title: "Cancel",
                style: .cancel,
                handler: nil
            )
        )
        present(ac, animated: true, completion: nil)
    }
}

#if DEBUG
import SwiftUI

struct JournalDetailViewControllerRepresentable: UIViewControllerRepresentable {
    
    let item: Journal
    
    func updateUIViewController(_ uiViewController: JournalDetailViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> JournalDetailViewController {
        let controller = JournalDetailRouter.createJournalDetailModule(with: item)
        return controller
    }
}


struct JournalDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        return JournalDetailViewControllerRepresentable(item: Journal(context: CoreDataManager.shared.moc))
    }
}
#endif
