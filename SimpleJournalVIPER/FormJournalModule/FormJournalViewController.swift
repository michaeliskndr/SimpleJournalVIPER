//
//  AddJournalViewController.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 13/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class FormJournalViewController: UIViewController {
    
    private let tableView = UITableView()
    private let presenter: FormJournalPresenter
    private var activeField: UIView?
    
    init(presenter: FormJournalPresenter) {
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
        addKeyboardObserver()
        presenter.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigation()
        setupLayouts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(JournalFormCell.self, forCellReuseIdentifier: "JournalFormCell")
        view.addSubview(tableView)
    }
    
    private func setupNavigation() {
        navigationItem.title = "Hello"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedAdd))
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    @objc func tappedAdd() {
        presenter.didAddJournal(from: self)
    }
    
}

extension FormJournalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalFormCell", for: indexPath) as! JournalFormCell
        let cellAtRow = presenter.cellForRow(at: indexPath)
        cell.configure(with: cellAtRow)
        cell.textViewDelegate(self)
        cell.textFieldDelegate(self)
        return cell
    }
    
}

extension FormJournalViewController: UITextViewDelegate, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else {
            return false
        }
        let text = currentText + string
        let point = textField.convert(textField.bounds.origin, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            presenter.updateText(text, at: indexPath)
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let currentText = textView.text else {
            textView.resignFirstResponder()
            return false
        }
        
        let text = currentText + text
        let point = textView.convert(textView.bounds.origin, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            presenter.updateText(text, at: indexPath)
        }
        
        textView.scrollRangeToVisible(range)
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        activeField = textView
        if textView.textColor == .systemBlue {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        activeField = nil
        if textView.text.isEmpty {
            textView.textColor = .systemBlue
            textView.text = "Please fill in again"
        }
    }
    
}

extension FormJournalViewController {
    
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfoKeyboard = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardSize = userInfoKeyboard.cgRectValue.size
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        if let activeField = activeField {
            let visibleRect = tableView.convert(activeField.frame, from: activeField)
            tableView.scrollRectToVisible(visibleRect, animated: true)
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        tableView.contentInset = .zero
        tableView.scrollIndicatorInsets = .zero
    }
}

#if DEBUG
import SwiftUI

struct AddJournalViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = FormJournalRouter.createAddJournalFormModule()
        return viewController
    }
}

struct AddJournalViewController_Previews: PreviewProvider {
    static var previews: some View {
        return AddJournalViewControllerRepresentable()
    }
}

#endif
