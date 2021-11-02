//
//  HomeViewController.swift
//  football-iOS
//
//  Created by endo on 2021/10/29.
//  Copyright © 2021 endo. All rights reserved.
//

import UIKit

protocol HomeView: AnyObject {
    
}

final class HomeViewController: UITabBarController {
    
    var presenter: HomeViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var viewControllers: [UIViewController] = []

       let sportTalkListViewController:SportTalkListViewController = SportTalkListViewController.instantiate()
       sportTalkListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostRecent, tag: 1)
        viewControllers.append(sportTalkListViewController)

       let repositorySearchResultView = SearchRouter.assembleModules()
        repositorySearchResultView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostViewed, tag: 2)
        viewControllers.append(repositorySearchResultView)


        self.setViewControllers(viewControllers, animated: false)

    }
}

extension HomeViewController: HomeView {

}

