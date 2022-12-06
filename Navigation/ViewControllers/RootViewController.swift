//
//  TestViewController.swift
//  Navigation
//
//  Created by Abdurrahman Gazi Yavuz on 12/1/22.
//

import UIKit

class RootViewController: UINavigationController {
    
    let test = HomeViewController()
    private let sub = Sub1ViewController()
    private let sub2 = Sub2ViewController()
    
    private var ttest: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationBar.barTintColor = .blue
        
//        navigationItem.rightBarButtonItems  = [
//            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
//            UIBarButtonItem(image: UIImage(systemName: "play.circle"), style: .done, target: self, action: nil)
//        ]
//
//        navigationBar.tintColor = .brown
        
        // Do any additional setup after loading the view.
//        addChild(test)
        pushViewController(test, animated: true)
        view.addSubview(test.view)
        test.didMove(toParent: self)
        
        test.delegate = self
    }

}

extension RootViewController: HomeViewControllerDelegate {
    
    func test(_ index: Int) {
        
        if index%2 == 0 {
            
            pushViewController(sub, animated: true)
            view.addSubview(sub.view)
            
        }else{
            
            pushViewController(sub2, animated: true)
            view.addSubview(sub2.view)
            
        }
        
    }
    
    func side() {
        
        let vc = SideViewController()
        vc.delegate = self
        addChild(vc)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        #warning("fix animations")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {
            
            vc.pushSideMenu()
            
        } completion: { done in
            if done {
                
            }
        }
        
    }
    
}

extension RootViewController: SideViewControllerDelegate {
    
    func popSideMenu() {
        
        let child = children.last!
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
        
    }
    
}

