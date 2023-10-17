//
//  CollectionCell.swift
//  CollectionViewLesson
//
//  Created by Aleksandr.Grachev on 16.10.2023.
//

import UIKit

final class CollectionCell: UICollectionViewCell {

    // MARK: Constant
    
    private enum Constant {
        enum TitleLabel {
            static let leading = 16.0
            static let trailing = 16.0
        }
    }

    // MARK: - Identifier

    static let identifier = "CollectionCell"

    // MARK: - Subviews
    
    private var image = UIImageView()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }

    // MARK: - Methods

    func configure(image: String) {
        self.image.image = UIImage(named: image)
    }

    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12.0
        
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 11, height: 11)
        contentView.layer.masksToBounds = false

        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
