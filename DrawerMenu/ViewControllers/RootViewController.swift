//
//  RootViewController.swift
//  DrawerMenu
//
//  Created by Abdurrahman Gazi Yavuz on 11/26/22.
//

import UIKit

class RootViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    private let sideMenuViewController = SideMenuViewController()
    private lazy var sideMenuWidth: CGFloat = view.frame.width * 0.45
    private var sideMenuTrailingConstraint: NSLayoutConstraint!
    private let homeViewController = HomeViewController()
    private var navigationViewController: UINavigationController?
    
    private func addChildViewControllers(){
        
        // Home
        #warning("Why did we use navController?")
        homeViewController.delegate = self
        let navigationViewController = UINavigationController(rootViewController: homeViewController)
        addChild(navigationViewController)
        view.addSubview(navigationViewController.view)
        navigationViewController.didMove(toParent: self)
        self.navigationViewController = navigationViewController
        
        // SideMenu
        #warning("Side menu VC is on top of homeVC in stack")
        #warning("Side menu VC trailing edge is at homeVC leading edge")
        #warning("We slides sideMenuVC by its width in x-dir with animation")
        #warning("Try alternatives")
        #warning("i.e. sideMenu is under homeVC in stack. Slide homeVC to show what is underneath")
        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        sideMenuViewController.view.translatesAutoresizingMaskIntoConstraints = false
        sideMenuViewController.view.widthAnchor.constraint(equalToConstant: sideMenuWidth).isActive = true
        sideMenuTrailingConstraint = sideMenuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -sideMenuWidth)
        sideMenuTrailingConstraint.isActive = true
        sideMenuViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sideMenuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        sideMenuViewController.didMove(toParent: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
        
    }

}

extension RootViewController: HomeViewControllerDelegate {
    
    func leftBarItemDidTap() {
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {
            
            self.sideMenuTrailingConstraint.constant = 0
            self.view.layoutIfNeeded()
            
        } completion: { done in
            if done {
                self.menuState = .opened
            }
        }
        
    }
    
    
    func panGestureToRight() {
    
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {
            
//            let totalWidth = self.homeViewController.view.frame.size.width
//
//            self.navigationViewController?.view.frame.origin.x = totalWidth * 0.55
            self.sideMenuTrailingConstraint.constant = 0
            self.view.layoutIfNeeded()
            
        } completion: { done in
            if done {
                self.menuState = .opened
            }
        }
        
    }
    
    func panGestureToLeft() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {
            
            self.sideMenuTrailingConstraint.constant = -self.sideMenuWidth
            self.view.layoutIfNeeded()

        } completion: { done in
            if done {
                self.menuState = .closed
            }
        }
        
    }
    
    func tapGestureDidTap() {
        
        switch menuState {
            
        case .closed:
            break
            
        case .opened:
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {
                
                self.sideMenuTrailingConstraint.constant = -self.sideMenuWidth
                self.view.layoutIfNeeded()

            } completion: { done in
                if done {
                    self.menuState = .closed
                }
            }
            
            break
        }
    }
    
}
