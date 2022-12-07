//
//  TestViewController.swift
//  Navigation
//
//  Created by Abdurrahman Gazi Yavuz on 12/1/22.
//

import UIKit

class HomeTabNavigationController: UINavigationController {
    
    let home = HomeViewController()
    private let sub1 = Sub1ViewController()
    private let sub2 = Sub2ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushViewController(home, animated: true)
        view.addSubview(home.view)
        home.delegate = self
    }

}

extension HomeTabNavigationController: HomeViewControllerDelegate {
    
    func test(_ index: Int) {
        
        if index%2 == 0 {
            
            pushViewController(sub1, animated: true)
            view.addSubview(sub1.view)
            
        }else{
            
            pushViewController(sub2, animated: true)
            view.addSubview(sub2.view)
            
        }
        
    }
    
    func side() {
        #warning("Fix that tabBar stays on top of sideMenu")
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

extension HomeTabNavigationController: SideViewControllerDelegate {
    
    func popSideMenu() {
        
        let child = children.last!
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
        
    }
    
}

