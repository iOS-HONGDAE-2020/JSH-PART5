//
//  TabBarViewController.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/22.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let tablePage = generateNavigationController(vc: firstTableViewController(), image: "tablecells.fill", itemtitle: "Table")
        let collectionPage = generateNavigationController(vc: firstCollectionViewController(), image: "square.grid.3x3.fill", itemtitle: "Collection")
        viewControllers = [tablePage, collectionPage]
    }

    fileprivate func generateNavigationController(vc: UIViewController, image: String, itemtitle: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
       
        // tabBarIcon
        let config = UIImage.SymbolConfiguration(weight: .ultraLight)
        navController.tabBarItem.image = UIImage(systemName: image, withConfiguration: config)
        navController.title = itemtitle
        
        return navController
    }

    

    

}
