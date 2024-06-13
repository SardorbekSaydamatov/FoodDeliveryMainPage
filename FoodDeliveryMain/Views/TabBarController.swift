//
//  TabBarController.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 11/06/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let placeHolderViewController = PlaceholderController(message: "Coming soon...")
        placeHolderViewController.tabBarItem = UITabBarItem(title: "EmptyCell", image: UIImage(systemName: "clock"), tag: 0)

        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "fork.knife"), tag: 1)
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        
        viewControllers = [placeHolderViewController, mainViewController, profileViewController]
        
        selectedIndex = 1
        tabBar.barTintColor = .systemBackground
        tabBar.tintColor = UIColor(red: 167/255.0, green: 214/255.0, blue: 140/255.0, alpha: 1.0)
        tabBar.unselectedItemTintColor = .gray
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let tabBarHeight: CGFloat = 70
        let horizontalInset: CGFloat = 10
        let verticalInset: CGFloat = 45
        
        var tabFrame = tabBar.frame
        tabFrame.size.height = tabBarHeight
        tabFrame.origin.y = view.frame.height - tabBarHeight - verticalInset + 20
        tabFrame.origin.x = horizontalInset
        tabFrame.size.width = view.frame.width - 2 * horizontalInset
        
        tabBar.frame = tabFrame
        tabBar.layer.cornerRadius = 15
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 1.0  // Border width
        tabBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
    }
}
