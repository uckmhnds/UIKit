//
//  SideViewController.swift
//  Navigation
//
//  Created by Abdurrahman Gazi Yavuz on 12/1/22.
//

import UIKit

protocol SideViewControllerDelegate: AnyObject {
    func popSideMenu()
}

class SideViewController: UIViewController {
    
    weak var delegate: SideViewControllerDelegate?
    
    private let sideMenuWidth: CGFloat = 120
    private var sideMenuLeadingConstraint: NSLayoutConstraint!
    
    private lazy var sideMenu: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(popSideMenu))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    func pushSideMenu(){
        
        sideMenuLeadingConstraint.constant = 0
        shadowView.alpha = 0.6
    }
    
    @objc private func popSideMenu(){
        
        sideMenuLeadingConstraint.constant = -sideMenuWidth
        shadowView.alpha = 0.0
        delegate?.popSideMenu()
    }
    
    private func applyConstraints(){
        
        let sideMenuView = [
            
            sideMenu.topAnchor.constraint(equalTo: view.topAnchor),
            sideMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideMenu.widthAnchor.constraint(equalToConstant: sideMenuWidth)
            
        ]
        
        sideMenuLeadingConstraint = sideMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        sideMenuLeadingConstraint.isActive = true
        
        NSLayoutConstraint.activate(sideMenuView)
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        view.addSubview(shadowView)
        
        view.addSubview(sideMenu)
        
        applyConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        shadowView.frame = view.bounds
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
