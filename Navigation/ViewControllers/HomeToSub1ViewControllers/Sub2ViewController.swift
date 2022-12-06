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
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("init")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboard are a pain")
    }
    
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sub2ViewController"
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        print("Sub2ViewControllerViewDidLoad")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
        if isMovingFromParent {
            print("isMovingFromParent")
            view.removeFromSuperview()
            removeFromParent()
            
        }
    }
    
    override func willMove(toParent parent: UIViewController?)
    {
        super.willMove(toParent: parent)
        if parent == nil
        {
            print("This VC is 'will' be popped. i.e. the back button was pressed.")
        }
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if parent != nil{
            print("This VC is 'is' pushed.")
        }
    }

}
