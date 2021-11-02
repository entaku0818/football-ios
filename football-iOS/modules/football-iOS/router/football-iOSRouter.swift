//
//  football-iOSRouter.swift
//  football-iOS
//
//  Created by endo on 2021/10/28.
//  Copyright © 2021 endo. All rights reserved.
//

import UIKit

protocol football-iOSWireframe: AnyObject {
    
}

final class football-iOSRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = football-iOSViewController()
        let router = football-iOSRouter(viewController: view)
        let interactor = football-iOSInteractor()
        let presenter = football-iOSViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension football-iOSRouter: football-iOSWireframe {
    
}
