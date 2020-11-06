//
//  MainListViewController.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 06/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import UIKit
import SwiftUI

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        view.addSubview(collectionView)
    }
    
    private func setupCollectionViewLayout() {
        guard let flowLayout = (collectionView.collectionViewLayout) as? UICollectionViewFlowLayout else {
            fatalError("CollectionViewFlowLayout Not Found")
        }
        
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
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
}


#if DEBUG
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
