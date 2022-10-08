//
//  TabViewController.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let firstVC     = UINavigationController(rootViewController: FirstViewController())
        let secondVC    = UINavigationController(rootViewController: SecondViewController())
        let thirdVC     = UINavigationController(rootViewController: ThirdViewController())
        
        firstVC.title               = "First"
        firstVC.tabBarItem.image    = UIImage(systemName: "1.circle.fill")
        
        secondVC.title              = "Second"
        secondVC.tabBarItem.image   = UIImage(systemName: "2.circle.fill")
        
        thirdVC.title               = "Third"
        thirdVC.tabBarItem.image    = UIImage(systemName: "3.circle.fill")
        
        tabBar.tintColor            = .label
        setViewControllers([firstVC, secondVC, thirdVC], animated: true)
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
