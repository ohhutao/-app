//
//  TabBarController.swift
//  Biggest Loser
//
//  Created by hutao on 2023/9/25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: FirstVC())
        vc1.tabBarItem = UITabBarItem(title: "Train", image: UIImage(named: "exercise"), tag: 0)
        
        let vc2 = UINavigationController(rootViewController: SecondVC())
        vc2.tabBarItem = UITabBarItem(title: "diet", image: UIImage(named: "mix"), tag: 1)
        
        let vc3 = UINavigationController(rootViewController: ThirdVc())
        vc3.tabBarItem = UITabBarItem(title: "diet", image: UIImage(named: "mix"), tag: 1)
        
        let vc4 = UINavigationController(rootViewController: itemController())
        vc4.tabBarItem = UITabBarItem(title: "Guide", image: UIImage(named: "information"), tag: 2)
        
        self.viewControllers = [vc1,vc3,vc4]
    }
    
}
