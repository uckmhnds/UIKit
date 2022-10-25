//
//  ViewController.swift
//  SheetPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 12.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableViewController = TableViewController()
    
    private lazy var stackView: UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        return stackView
    }()
    
    private lazy var label: UILabel = {
        let label   = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "Hello"
        return label
    }()
    
    private lazy var button: UIButton = {
        
        var config   = UIButton.Configuration.filled()
        config.title = "Show Sheet"
        
        let button  = UIButton(configuration: config, primaryAction: showSheetAction)
        
        return button
        
    }()
    
    private lazy var showSheetAction: UIAction = {
        
        let action  = UIAction(){ _ in
            self.tableViewController.delegate   = self
            
            /// Set this to present always. Keeps prevent closing
//            self.tableViewController.isModalInPresentation = true
            
            if let sheet = self.tableViewController.sheetPresentationController{
                
                let customDetent = UISheetPresentationController.Detent.custom { _ in
                    return 50
                }
                
                sheet.detents = [customDetent, .medium(), .large()]
                sheet.prefersGrabberVisible = true
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.largestUndimmedDetentIdentifier = .medium
            }
            
//            self.view.backgroundColor = .clear
            self.modalPresentationStyle = .pageSheet
            
            self.present(self.tableViewController, animated: true)
            
        }
        return action
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
        // Do any additional setup after loading the view.
        
        view.addSubview(stackView)
        
        applyConstraints()
        
    }
    
}

extension ViewController: TableViewControllerDelegate {
    func tableViewControllerDidSelect(item: String) {
        self.label.text = item
    }
}
