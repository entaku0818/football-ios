//
//  HomeRouter.swift
//  football-iOS
//
//  Created by endo on 2021/10/29.
//  Copyright © 2021 endo. All rights reserved.
//

import UIKit

protocol HomeWireframe: AnyObject {
    
}

final class HomeRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = HomeViewController()
        let router = HomeRouter(viewController: view)
        let presenter = HomeViewPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

extension HomeRouter: HomeWireframe {
    
}
