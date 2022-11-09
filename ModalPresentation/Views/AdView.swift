//
//  AdView.swift
//  ModalPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 11/2/22.
//

import UIKit

class AdView: UIView {
    
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
    
    private lazy var adLabelMedium: UILabel = {
        
        let label = UILabel()
        label.text = "This is an"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var adLabelBig: UILabel = {
        
        let label = UILabel()
        label.text = "AD"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var adLabelSmall: UILabel = {
        
        let label = UILabel()
        label.text = "(Tap outside to close this view)"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var stackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [adLabelMedium, adLabelBig, adLabelSmall])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillProportionally
        view.isLayoutMarginsRelativeArrangement = true
        return view
        
    }()
    
    private lazy var pickerHolderView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
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
            
            pickerHolderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60.0),
            pickerHolderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60.0),
            pickerHolderView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ]
        
        let stackViewConstraints = [
        
            stackView.topAnchor.constraint(equalTo: pickerHolderView.topAnchor, constant: 20.0),
            stackView.leadingAnchor.constraint(equalTo: pickerHolderView.leadingAnchor, constant: 20.0),
            stackView.trailingAnchor.constraint(equalTo: pickerHolderView.trailingAnchor, constant: -20.0),
            stackView.bottomAnchor.constraint(equalTo: pickerHolderView.bottomAnchor, constant: -20.0)
            
        ]
        
        NSLayoutConstraint.activate(blurredEffectViewConstraints)
        NSLayoutConstraint.activate(pickerHolderViewConstraints)
        NSLayoutConstraint.activate(stackViewConstraints)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(self.blurredEffectView)
        addSubview(self.pickerHolderView)

        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubview(blurredEffectView)
        addSubview(pickerHolderView)

        applyConstraints()
    }
    
}
