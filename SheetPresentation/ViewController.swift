//
//  ViewController.swift
//  SheetPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 12.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var showSheetAction: UIAction = {
        
        let action  = UIAction(){ _ in
            
            let sheetViewController     = SheetViewController()
            
            sheetViewController.delegate   = self
            
            /// Set this true to present always. Keeps prevent closing
            sheetViewController.isModalInPresentation = false
            
            if let sheet = sheetViewController.sheetPresentationController{
                
                let customSmallDetent = UISheetPresentationController.Detent.custom { _ in
                    
                    let height  = self.view.bounds.height
                    // %10 of entire screen height
                    let detentHeight = height * 0.1
                    
                    return detentHeight
                }
                
                let customMediumDetent = UISheetPresentationController.Detent.custom { _ in
                    
                    let height  = self.view.bounds.height
                    // %35 of entire screen height
                    let detentHeight = height * 0.35
                    
                    return detentHeight
                }
                
                sheet.detents = [customSmallDetent, customMediumDetent, .medium(), .large()]
                sheet.prefersGrabberVisible = true
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.largestUndimmedDetentIdentifier = customMediumDetent.identifier
                
            }
            
//            self.view.backgroundColor = .clear
            self.modalPresentationStyle = .pageSheet
            
            self.present(sheetViewController, animated: true)
            
        }
        return action
        
    }()
    
    private lazy var button: UIButton = {
        
        var config   = UIButton.Configuration.filled()
        config.title = "Show Sheet"
        
        let button  = UIButton(configuration: config, primaryAction: showSheetAction)
        
        return button
        
    }()
    
    private lazy var label: UILabel = {
        let label   = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "Hello"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        return stackView
    }()
    
    
    fileprivate func applyConstraints(){
        
        let stackViewConstraints    = [
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(stackViewConstraints)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        view.addSubview(stackView)
        
        applyConstraints()
        
    }
    
}

extension ViewController: SheetViewControllerDelegate {
    
    func sheetViewControllerDidSelect(item: String) {
        
        self.label.text = item
        
    }
    
}
