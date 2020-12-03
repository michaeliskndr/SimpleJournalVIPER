//
//  JournalCell.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class JournalCell: UICollectionViewCell {
    
    private let titleLabel = UILabel(forTextStyle: .headline)
    private let moodLabel = UILabel(forTextStyle: .headline)
    private let detailLabel = UILabel(forTextStyle: .body)
    private let dateLabel = UILabel(forTextStyle: .footnote)
    private let vStack = UIStackView()
    private let hStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let itemWidth: CGFloat = UIScreen.main.bounds.width - 44
        
        return super.contentView.systemLayoutSizeFitting(CGSize(width: itemWidth, height: UIView.layoutFittingExpandedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implementing storyboard")
    }
    
    private func setupViews() {
        contentView.backgroundColor = UIColor.offWhite

        detailLabel.numberOfLines = 0
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.distribution = .fill
        
        hStack.addArrangedSubview(titleLabel)
        hStack.addArrangedSubview(moodLabel)
        hStack.addArrangedSubview(UIView())
        
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        vStack.addArrangedSubview(hStack)
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
    
    func configure(with item: Journal) {
        titleLabel.text = item.title
        detailLabel.text = item.detail
        let dateString = item.date?.toString()
        dateLabel.text = dateString
        moodLabel.text = item.mood?.mood
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow(view: contentView)

    }
    
    private func setupShadow(view: UIView) {
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true

        view.layer.shadowColor = UIColor.shadowColor.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        view.layer.shadowRadius = 3.0
        view.layer.shadowOpacity = 1.0
        view.layer.masksToBounds = false
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
    }
    
    
}

#if DEBUG
import SwiftUI

struct JournalCellRepresentable: UIViewRepresentable {
    
    let item = Journal(context: CoreDataManager.shared.getContext())
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
        
        return JournalCellRepresentable()
            .frame(minWidth: 0, idealWidth: itemWidth, maxWidth: itemWidth, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: itemHeight, maxHeight: itemHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .environment(\.sizeCategory, ContentSizeCategory.large)
    }
}
#endif

