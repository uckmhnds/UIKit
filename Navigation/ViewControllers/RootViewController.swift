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
//        addChild(sub)
//        view.addSubview(sub.view)
//        sub.didMove(toParent: self)
//
//        addChild(sub2)
//        view.addSubview(sub2.view)
//        sub2.didMove(toParent: self)
    }

}

extension RootViewController: HomeViewControllerDelegate {
    
    func test(_ index: Int) {
        
        print("TEST")
        
        if index%2 == 0 {
            
            pushViewController(sub, animated: true)
            view.addSubview(sub.view)
            sub.didMove(toParent: self)
            
            
        }else{
            
            pushViewController(sub2, animated: true)
            view.addSubview(sub2.view)
            sub2.didMove(toParent: self)
            
        }
        
    }
    
    func side() {
        let vc = SideViewController()
        vc.delegate = self
        addChild(vc)
        view.addSubview(vc.view)
//        let sideMenuWidth: CGFloat = 120
//        vc.view.translatesAutoresizingMaskIntoConstraints = false
//        vc.view.widthAnchor.constraint(equalToConstant: sideMenuWidth).isActive = true
//        let sideMenuTrailingConstraint = vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -sideMenuWidth)
//        sideMenuTrailingConstraint.isActive = true
//        vc.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        vc.didMove(toParent: self)
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {
            
//            sideMenuTrailingConstraint.constant = 0
            vc.pushSideMenu()
//            self.view.layoutIfNeeded()
            
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

/*
extension RootViewController: Sub1ViewControllerDelegate {
    
    func test2() {
        
        print(view.subviews.count)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {

//            self.ttest.constant = self.view.frame.width
//            self.view.layoutIfNeeded()


        } completion: { done in
            if done {
//                self.sub.willMove(toParent: nil)
//                self.sub.view.removeFromSuperview()
//                self.sub.removeFromParent()
//                self.popViewController(animated: true)
            }
        }
        
    }
    
}

extension RootViewController: Sub2ViewControllerDelegate {
    
    func test3() {
        
        print(self.view.subviews.count)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {

            self.ttest.constant = self.view.frame.width
            self.view.layoutIfNeeded()

        } completion: { done in
            if done {
                self.popViewController(animated: true)
//                self.sub2.view.removeFromSuperview()
//                self.navigationController?.popViewController(animated: true)
                self.sub2.willMove(toParent: nil)
                self.sub2.view.removeFromSuperview()
                self.sub2.removeFromParent()
                print(self.view.subviews.count)
            }
        }
        
        
    }
    
}
*/
