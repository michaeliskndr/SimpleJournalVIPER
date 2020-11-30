//
//  JournalFormCell.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 17/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class JournalFormCell: UITableViewCell {
    
    private let titleLabel = UILabel(forTextStyle: .headline)
    private let titleTextfield = CustomTextField(insetX: 8, insetY: 8)
    private let titleTextView = UITextView(frame: .zero, textContainer: nil)
    private let datePickerView = UIDatePicker(frame: .zero)
    private let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: 40, height: 40))
    private lazy var doneBarButtonItem: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
    }()
    private lazy var flexibleSpace: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }()
    private let slider: UISlider = UISlider(frame: .zero)
    private let vStack = UIStackView()
    
    private var presenter: JournalCellPresenter?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented storyboard")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCorner(views: titleTextfield, titleTextView)
    }
    
    private func setupViews() {
        titleTextfield.font = CustomScaleFont.customFont(forStyle: .subheadline)
        titleTextfield.adjustsFontForContentSizeCategory = true
        titleTextfield.backgroundColor = .systemGray5
        titleTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        titleTextView.font = CustomScaleFont.customFont(forStyle: .subheadline)
        titleTextView.adjustsFontForContentSizeCategory = true
        titleTextView.backgroundColor = .systemGray5
        titleTextView.textContainerInset = .init(top: 8, left: 8, bottom: 0, right: 0)
        titleTextView.textContainer.lineFragmentPadding = 0
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        toolBar.setItems([flexibleSpace, doneBarButtonItem], animated: false)
        titleTextView.inputAccessoryView = toolBar
        
        vStack.axis = .vertical
        vStack.spacing = 4
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.minimumValueImage = UIImage(systemName: "hand.thumbsdown.fill")
        slider.maximumValueImage = UIImage(systemName: "hand.thumbsup.fill")
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    
        datePickerView.datePickerMode = .date
        datePickerView.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        [titleLabel, titleTextfield, titleTextView, slider, datePickerView].forEach { vStack.addArrangedSubview($0) }

        contentView.addSubview(vStack)

    }
    
    func configure(with presenter: JournalCellPresenter) {
        self.presenter = presenter
        titleLabel.text = presenter.title
        titleTextfield.text = presenter.subtitle
        titleTextfield.attributedPlaceholder = NSAttributedString(string: presenter.placeholder, attributes: [.foregroundColor: UIColor.systemBlue])
        datePickerView.date = presenter.date
        slider.value = presenter.floatHappiness
        switch presenter.type {
        case .title:
            datePickerView.isHidden = true
            titleTextView.isHidden = true
            slider.isHidden = true
        case .detail:
            datePickerView.isHidden = true
            titleTextfield.isHidden = true
            slider.isHidden = true
        case .date:
            titleTextfield.isHidden = true
            titleTextView.isHidden = true
            slider.isHidden = true
        case .mood:
            datePickerView.isHidden = true
            titleTextfield.isHidden = true
            titleTextView.isHidden = true
        }
        if titleTextView.text.isEmpty {
            titleTextView.text = presenter.placeholder
            titleTextView.textColor = .systemBlue
        } else {
            titleTextView.text = presenter.subtitle
        }
    }
    
    func textFieldDelegate(_ delegate: UITextFieldDelegate?) {
        titleTextfield.delegate = delegate
    }
    
    func textViewDelegate(_ delegate: UITextViewDelegate?) {
        titleTextView.delegate = delegate
    }
    
    @objc func valueChanged(_ sender: UISlider) {
        let happiness = Double(sender.value)
        presenter?.update(happiness)
    }
    
    @objc func tappedDone() {
        titleTextView.resignFirstResponder()
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        presenter?.update(sender.date)
        sender.resignFirstResponder()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleTextfield.widthAnchor.constraint(equalTo: vStack.widthAnchor),
            titleTextfield.heightAnchor.constraint(equalToConstant: 44),
            titleTextView.widthAnchor.constraint(equalTo: vStack.widthAnchor),
            titleTextView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func setupCorner(views: UIView...) {
        for view in views {
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
        }
    }
    
}

#if DEBUG
import SwiftUI

struct JournalFormCellRepresentable: UIViewRepresentable {
    
    func updateUIView(_ uiView: JournalFormCell, context: Context) {
    }
    
    func makeUIView(context: Context) -> JournalFormCell {
        let cell = JournalFormCell()
        cell.configure(with:
            JournalCellPresenter(
                title: "What is your title today?",
                subtitle: "",
                placeholder: "Describe your title today!",
                type: .detail
            )
        )

        return cell
    }
}

struct JournalFormCellRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        return JournalFormCellRepresentable()
            .frame(width: UIScreen.main.bounds.width, height: 320)
    }
}

#endif
