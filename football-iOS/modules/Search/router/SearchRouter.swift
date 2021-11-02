//
//  SearchRouter.swift
//  football-iOS
//
//  Created by endo on 2021/10/28.
//  Copyright © 2021 endo. All rights reserved.
//

import UIKit

protocol SearchWireframe: AnyObject {
    func showPlayer()
}

final class SearchRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = UIStoryboard.init(name: "SearchViewController", bundle: nil).instantiateInitialViewController() as! SearchViewController
        let router = SearchRouter(viewController: view)
        let interactor = SearchInteractor()
        let presenter = SearchViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}

extension SearchRouter: SearchWireframe {
    func showPlayer() {
        
    }

    
}
