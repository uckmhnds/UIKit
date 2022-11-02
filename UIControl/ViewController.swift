//
//  ViewController2.swift
//  Button
//
//  Created by Abdurrahman Gazi Yavuz on 10/31/22.
//

import UIKit

class ViewController: UIViewController {
    
    let radioButtons = RadioButtons()
    let shopping = ShoppingCart()
    let music = MusicControl()
    let date = DatePicker()
    
    
    private lazy var stackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [radioButtons, date, shopping, music])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.alignment = .center
        view.axis = .vertical
        view.spacing = 12
        view.distribution = .fillEqually
        
        return view
    }()
    
    private func applyConstraints(){
        
        let stackViewConstraint = [
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(stackViewConstraint)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(stackView)
        
        view.backgroundColor = .systemBackground
        
        applyConstraints()
        
        
    }

}

