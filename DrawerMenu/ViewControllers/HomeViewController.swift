//
//  ViewController.swift
//  DrawerMenu
//
//  Created by Abdurrahman Gazi Yavuz on 11/26/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject{
    
    func tapGestureDidTap()
    
    func panGestureToRight()
    
    func panGestureToLeft()
    
    func leftBarItemDidTap()
    
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?
    
    @objc private func tapGestureDidTap(_ sender: UITapGestureRecognizer) {
        delegate?.tapGestureDidTap()
    }
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDidTap(_:)))
        
        return gesture
        
    }()
    
    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
        
        let velocity = sender.velocity(in: view).x
        
        if velocity < 0 {
            delegate?.panGestureToLeft()
        }else {
            delegate?.panGestureToRight()
        }
        
    }
    
    private lazy var panGesture: UIPanGestureRecognizer = {
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        
        return gesture
        
    }()
    
    @objc private func leftBarItemDidTap(_ sender: UITapGestureRecognizer){
        
        delegate?.leftBarItemDidTap()
        
    }
    
    private func setNavBar(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(leftBarItemDidTap(_:)))
        
        navigationController?.navigationBar.tintColor   = .black
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        view.addGestureRecognizer(panGesture)
        
        view.addGestureRecognizer(tapGesture)
        
        setNavBar()
        
    }

}

