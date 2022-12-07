//
//  TestViewController.swift
//  Navigation
//
//  Created by Abdurrahman Gazi Yavuz on 12/7/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let home = HomeTabNavigationController() // This is already a UINavigationController
        let work = UINavigationController(rootViewController: WorkViewController())
        
        home.tabBarItem.image           = UIImage(systemName: "house")
        home.tabBarItem.selectedImage   = UIImage(systemName: "house.fill")
        
        work.tabBarItem.image           = UIImage(systemName: "music.note.house")
        work.tabBarItem.selectedImage   = UIImage(systemName: "music.note.house.fill")
        work.title                      = "Work"
        
        tabBar.tintColor                = .label
        
        setViewControllers([home, work], animated: true)
        
    }

}
