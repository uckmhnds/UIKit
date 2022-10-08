//
//  CollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    static let identifier   = "FirstCollectionViewCell"
    
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
