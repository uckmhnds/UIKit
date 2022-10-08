//
//  CollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier   = "CollectionViewCell"
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor     = .systemRed
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
