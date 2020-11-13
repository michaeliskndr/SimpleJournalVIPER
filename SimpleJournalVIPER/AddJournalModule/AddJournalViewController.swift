//
//  AddJournalViewController.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class AddJournalViewController: UIViewController {

    private let titleLabel = UILabel(forTextStyle: .largeTitle)
    private let titleTextField = UITextField()
    private let detaiLabel = UILabel()
    private let detailTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
//        titleLabel.font = CustomScaleFont.customFont(forStyle: .headline)
//        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Hello World"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}


#if DEBUG
import SwiftUI

struct AddJournalViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = AddJournalViewController()
        return viewController
    }
}

struct AddJournalViewController_Previews: PreviewProvider {
    static var previews: some View {
        return AddJournalViewControllerRepresentable()
    }
}

#endif
