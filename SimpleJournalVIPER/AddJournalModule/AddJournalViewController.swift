//
//  AddJournalViewController.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class AddJournalViewController: UIViewController {

    private let tableView = UITableView()
    private let presenter: AddJournalPresenter
    
    init(presenter: AddJournalPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.reload = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Does not implemented storyboard")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Hello"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(JournalFormCell.self, forCellReuseIdentifier: "JournalFormCell")
        view.addSubview(tableView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
}

extension AddJournalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalFormCell", for: indexPath) as! JournalFormCell
        let cellAtRow = presenter.cellForRow(at: indexPath)
        cell.configure(with: cellAtRow)
        cell.textViewDelegate(self)
        return cell
    }
    
}

extension AddJournalViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        textView.scrollRangeToVisible(range)
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = .lightGray
            textView.text = "Hello World Test"
        }
    }
}

#if DEBUG
import SwiftUI

struct AddJournalViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = AddJournalRouter.createAddJournalModule()
        return viewController
    }
}

struct AddJournalViewController_Previews: PreviewProvider {
    static var previews: some View {
        return AddJournalViewControllerRepresentable()
    }
}

#endif
