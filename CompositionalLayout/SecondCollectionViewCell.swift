//
//  SecondCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    static let identifier   = "SecondCollectionViewCell"
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor     = .systemBlue
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
