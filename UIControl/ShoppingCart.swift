//
//  ShoppingCart.swift
//  Button
//
//  Created by Abdurrahman Gazi Yavuz on 10/31/22.
//

import UIKit

class ShoppingCart: UIStackView {
    
    private lazy var isCartEmpty = true {
        didSet {
            checkOutButton.setNeedsUpdateConfiguration()
        }
    }
    
    private lazy var numberOfItemsInTheCart = 0 {
        didSet {
            checkOutButton.setNeedsUpdateConfiguration()
        }
    }
    
    private lazy var doYouHaveCoupon = false {
        didSet {
            checkOutButton.setNeedsUpdateConfiguration()
        }
    }
    
    @objc private func binaryChoiceChanged(){
        doYouHaveCoupon = binaryChoice.isOn
    }
    
    private lazy var binaryChoice: UISwitch = {
        let binaryChoice = UISwitch()
        binaryChoice.isOn = false
        binaryChoice.addTarget(self, action: #selector(binaryChoiceChanged), for: .valueChanged)
        return binaryChoice
    }()
    
    @objc private func stepperChanged(){
        numberOfItemsInTheCart = Int(stepper.value)
        
        if numberOfItemsInTheCart == 0 {
            isCartEmpty = true
        }else{
            isCartEmpty = false
        }
    }
    
    private lazy var stepper: UIStepper = {
        
        let stepper = UIStepper(frame: .zero)
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        stepper.minimumValue = 0
        stepper.maximumValue = 99
        stepper.stepValue = 1
        stepper.value = 0
        return stepper
    }()
    
    private lazy var checkOutButton: UIButton = {
        
        let button = UIButton()
        
        button.configurationUpdateHandler = {
            
            [unowned self] button in

            var config              = UIButton.Configuration.tinted()
            config.title            = doYouHaveCoupon ? "Items+Coupon" : "Items"
            config.image            = isCartEmpty ? UIImage(systemName: "cart.badge.plus") : UIImage(systemName: "cart.fill.badge.plus")
            config.imagePlacement   = .trailing
            config.subtitle         = "\(self.numberOfItemsInTheCart) Items"
            button.configuration    = config
        }
        
        return button
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        isLayoutMarginsRelativeArrangement = true
        alignment = .center
        axis = .horizontal
        spacing = 12
        
        addArrangedSubview(stepper)
        addArrangedSubview(checkOutButton)
        addArrangedSubview(binaryChoice)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
