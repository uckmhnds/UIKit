//
//  Sub1ViewController.swift
//  Navigation
//
//  Created by Abdurrahman Gazi Yavuz on 11/30/22.
//

import UIKit

protocol Sub1ViewControllerDelegate: AnyObject {
    
    func test2()
    
}

class Sub1ViewController: UIViewController {
    
    weak var delegate: Sub1ViewControllerDelegate?
    
    @objc func test(){
        delegate?.test2()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sub1ViewController"

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        
    }

}
