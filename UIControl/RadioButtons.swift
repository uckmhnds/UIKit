//
//  RadioButtons.swift
//  Button
//
//  Created by Abdurrahman Gazi Yavuz on 10/31/22.
//

import UIKit

class RadioButtons: UIStackView {
    
    enum Test{
        case type1
        case type2
        case type3
    }
    
    private lazy var testType = Test.type1 {
        didSet{
            sub1button1.setNeedsUpdateConfiguration()
            sub1button2.setNeedsUpdateConfiguration()
            sub1button3.setNeedsUpdateConfiguration()
        }
    }
    
    private lazy var sub1button1: UIButton = {
        
        let action = UIAction { _ in
            self.testType = Test.type1
            self.stateTextLabel.text = "subbutton1"
        }
        
        let button = UIButton(primaryAction: action)
        
        button.configurationUpdateHandler = {
            
            [unowned self] button in

            var config              = testType == Test.type1 ? UIButton.Configuration.filled() : UIButton.Configuration.gray()
            config.title            = "subbutton1"
            button.configuration    = config
        }
        
        return button
    }()
    
    private lazy var sub1button2: UIButton = {
        
        let action = UIAction { _ in
            self.testType = Test.type2
            self.stateTextLabel.text = "subbutton2"
        }
        
        let button = UIButton(primaryAction: action)
        
        button.configurationUpdateHandler = {
            
            [unowned self] button in

            var config              = testType == Test.type2 ? UIButton.Configuration.filled() : UIButton.Configuration.gray()
            config.title            = "subbutton2"
            button.configuration    = config
        }
        
        return button
    }()
    
    private lazy var sub1button3: UIButton = {
        
        let action = UIAction { _ in
            self.testType = Test.type3
            self.stateTextLabel.text = "subbutton3"
        }
        
        let button = UIButton(primaryAction: action)
        
        button.configurationUpdateHandler = {
            
            [unowned self] button in

            var config              = testType == Test.type3 ? UIButton.Configuration.filled() : UIButton.Configuration.gray()
            config.title            = "subbutton3"
            button.configuration    = config
        }
        
        return button
    }()
    
    private lazy var stateTextLabel: UILabel = {
        let label = UILabel()
        label.text = "subbutton1"
        return label
    }()
    
    private lazy var subStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sub1button1, sub1button2, sub1button3])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.alignment = .center
        view.axis = .horizontal
        view.spacing = 12
        view.distribution = .fillEqually
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        isLayoutMarginsRelativeArrangement = true
        alignment = .center
        axis = .vertical
        spacing = 0
        distribution = .fill
        
        addArrangedSubview(stateTextLabel)
        addArrangedSubview(subStackView)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
