//
//  Sub2ViewController.swift
//  Navigation
//
//  Created by Abdurrahman Gazi Yavuz on 11/30/22.
//

import UIKit


protocol Sub2ViewControllerDelegate: AnyObject {
    
    func test3()
    
}

class Sub2ViewController: UIViewController {
    
    weak var delegate: Sub2ViewControllerDelegate?
    
    @objc func test(){
        delegate?.test3()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        title = "Sub2ViewController"
        
        
    }

}
