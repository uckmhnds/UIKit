//
//  ImageView.swift
//  ModalPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 11/7/22.
//

import UIKit

class CollectionModalView: UIView {
    
    // To dismiss the AdView
    var dismissClosure: (()->())?
    
    @objc func tapHandler(_ g: UITapGestureRecognizer) -> Void {
        dismissClosure?()
    }
    
    private lazy var blurredEffectView: UIVisualEffectView = {
        
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        view.addGestureRecognizer(tapRecognizer)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    @objc func swipeDown(_ g: UISwipeGestureRecognizer) {
        print("swipeDown")
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
        
    }
    
    private lazy var imageView: UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
        swipeDownGesture.direction = [.down, .left, .right, .up]
        swipeDownGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(swipeDownGesture)
        return view
        
    }()
    
    private lazy var pickerHolderView: UIView = {
        
        let view = UIView()
        
        view.layer.cornerRadius = 8
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        return view
        
    }()
    
    private func applyConstraints(){
        
        let blurredEffectViewConstraints = [
            
            blurredEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurredEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurredEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurredEffectView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ]
        
        let pickerHolderViewConstraints = [
            
            pickerHolderView.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            pickerHolderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60.0),
            pickerHolderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60.0),
            pickerHolderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -240)
            
        ]
        
        let imageViewConstraints = [

            imageView.topAnchor.constraint(equalTo: pickerHolderView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: pickerHolderView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: pickerHolderView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: pickerHolderView.bottomAnchor)

        ]
        
        NSLayoutConstraint.activate(blurredEffectViewConstraints)
        NSLayoutConstraint.activate(pickerHolderViewConstraints)
        NSLayoutConstraint.activate(imageViewConstraints)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(blurredEffectView)
        addSubview(pickerHolderView)

        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubview(blurredEffectView)
        addSubview(pickerHolderView)

        applyConstraints()
    }
}
