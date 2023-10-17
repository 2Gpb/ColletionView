//
//  ViewController.swift
//  CollectionViewLesson
//
//  Created by Aleksandr.Grachev on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Constants

    private enum Constant {
        enum Collection {
            static let cellHeight = 150.0
            static let sectionInsets = UIEdgeInsets(top: 10, left: 18, bottom: 24, right: 18)
            static let lineSpacing = 20.0
            static let interitemSpacing = 1.0
        }
    }

    private enum MainSection: Int, CaseIterable {
        case main
    }

    // MARK: - Properties

    private var images = ["Strawberries", "Banana", "Orange", "Apple"]

    // MARK: - Subviews

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func loadView() {
        super.loadView()
        title = "Фрукты"
    }

    // MARK: - Methods

    private func configureUI() {
        view.backgroundColor = .white
        let color = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        view.backgroundColor = color
        
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UICollectionViewDelegate


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        MainSection.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = MainSection.allCases[section]

        switch sectionType {
        case .main:
            return images.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let section = MainSection.allCases[indexPath.section]

        switch section {
        case .main:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionCell.identifier,
                for: indexPath
            ) as? CollectionCell else { return UICollectionViewCell() }

            cell.configure(image: images[indexPath.item])

            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPeritem = (view.frame.width / 2) + 19
        
        if indexPath.item % 4 == 0 || indexPath.item % 4 == 3 {
            return CGSize(width: widthPeritem * 0.6, height: Constant.Collection.cellHeight)
        } else {
            return CGSize(width: widthPeritem, height: Constant.Collection.cellHeight)
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Constant.Collection.sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constant.Collection.interitemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constant.Collection.lineSpacing
    }
}
