//
//  JournalCell.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class JournalCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let dateLabel = UILabel()
    private let vStack = UIStackView()
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        
        return formatter
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let itemWidth: CGFloat = UIScreen.main.bounds.width - 32
        
        return super.contentView.systemLayoutSizeFitting(CGSize(width: itemWidth, height: UIView.layoutFittingExpandedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implementing storyboard")
    }
    
    private func setupViews() {
        contentView.backgroundColor = UIColor.systemGray6
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        detailLabel.adjustsFontForContentSizeCategory = true
        detailLabel.numberOfLines = 0
        
        dateLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(detailLabel)
        
        contentView.addSubview(vStack)
        contentView.addSubview(dateLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vStack.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -8),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateLabel.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with item: JournalItem) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
        let dateString = dateFormatter.string(from: item.date)
        dateLabel.text = dateString
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow(view: contentView)

    }
    
    private func setupShadow(view: UIView) {
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true

        view.layer.shadowColor = UIColor.systemGray3.cgColor
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowRadius = 1.0
        view.layer.shadowOpacity = 1.0
        view.layer.masksToBounds = false
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
    }
    
    
}

#if DEBUG
import SwiftUI

struct JournalCellRepresentable: UIViewRepresentable {
    
    let item = JournalItem(id: 5, title: "Hello World", date: Date(), detail: "Heheheheheeh HeheheheheehHeheheheheehHeheheheheehHeheheheheehHeheheheheehHeheheheheeh i delete shit", mood: .init(happiness: 98.5, mood: "Happy"))
    
    func updateUIView(_ uiView: JournalCell, context: Context) {
    }
    
    func makeUIView(context: Context) -> JournalCell {
        let cell = JournalCell()
        cell.configure(with: item)
        return cell
    }
}

struct JournalCellRepresentable_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let itemWidth: CGFloat = UIScreen.main.bounds.width - 32
        let itemHeight: CGFloat = 180
        
        return JournalCellRepresentable().frame(minWidth: 0, idealWidth: itemWidth, maxWidth: itemWidth, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: itemHeight, maxHeight: itemHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
#endif
