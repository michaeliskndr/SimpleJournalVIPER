//
//  MainListViewController.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit

class MainListViewController: UIViewController {
    
    private var presenter: MainListPresenterProtocol
    
    private let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init(presenter: MainListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.reload = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Storyboard not implemented yet")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupCollectionViewLayout()
        presenter.viewWillAppear()

    }
    
    private func setupViews() {
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(JournalCell.self, forCellWithReuseIdentifier: "JournalCell")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        view.addSubview(collectionView)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Simple Journal"
        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: CustomScaleFont.customFont(style: .title3)
        ]
        let largeAttrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: CustomScaleFont.customFont(style: .largeTitle)
        ]
        navigationController?.navigationBar.titleTextAttributes = attrs
        navigationController?.navigationBar.largeTitleTextAttributes = largeAttrs
    }
    
    private func setupCollectionViewLayout() {
        guard let flowLayout = (collectionView.collectionViewLayout) as? UICollectionViewFlowLayout else {
            fatalError("CollectionViewFlowLayout Not Found")
        }
        
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 8
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
    }
    
}

extension MainListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JournalCell", for: indexPath) as! JournalCell
        let item = presenter.itemForRow(indexPath)
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.goToDetail(from: self, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        view.configure(with: "Hello World, How Are you")
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let indexPath = IndexPath(item: 0, section: section)
        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)

        
        let headerWidth: CGFloat = collectionView.frame.width
        return
            headerView.systemLayoutSizeFitting(CGSize(width: headerWidth, height: UIView.layoutFittingExpandedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }
}


#if DEBUG
import SwiftUI

struct MainListViewControllerRepresentable: UIViewControllerRepresentable {

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MainListRouter.createMainListModule()
        return vc
    }
}

struct MainListViewController_Previews: PreviewProvider {
    static var previews: some View {
        return MainListViewControllerRepresentable()
    }
}

#endif
