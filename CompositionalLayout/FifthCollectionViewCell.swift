//
//  FifthCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

class FifthCollectionViewCell: UICollectionViewCell {
    
    static let identifier   = "FifthCollectionViewCell"
    
    private let text: UILabel   = {
        
        let text    = UILabel()
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.text   = "FifthCollectionViewCell"
        
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
        
        
        contentView.addSubview(text)
        contentView.backgroundColor     = .systemCyan
        applyConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
