//
//  CollectionViewCell.swift
//  ModalPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 11/8/22.
//

import UIKit

protocol CollectionViewCellGesture: AnyObject {
    func collectionViewCellDidLongPress(_ image: UIImage)
}

class CollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    static let identifier = "CollectionViewCell"
    
    weak var delegate: CollectionViewCellGesture?
    
    func setImage(_ image: UIImage){
        iconImage = image
        iconView.image = image
    }
    
    private lazy var iconImage: UIImage = {
        let image = UIImage(systemName: "car")!
        return image
    }()
    
    private lazy var iconView: UIImageView = {
        
        let view = UIImageView(image: iconImage)
        
        return view
    }()
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressCell(_:)))
        recognizer.delegate = self
        recognizer.minimumPressDuration = 1.0
        recognizer.numberOfTouchesRequired = 1
        recognizer.allowableMovement = 10
        return recognizer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(iconView)
        contentView.addGestureRecognizer(longPressGesture)
        contentView.isUserInteractionEnabled = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc func longPressCell(_ recognizer: UILongPressGestureRecognizer) -> Void{
        
        delegate?.collectionViewCellDidLongPress(iconImage)
        
    }
}
