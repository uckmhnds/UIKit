//
//  CollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    static let identifier   = "FirstCollectionViewCell"
    
    private let text: UILabel   = {
        
        let text    = UILabel()
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.text   = "FirstCell"
        
        return text
        
    }()
    
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor     = .systemRed
        contentView.addSubview(text)
        applyConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
