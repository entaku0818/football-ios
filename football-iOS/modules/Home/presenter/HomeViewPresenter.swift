//
//  HomeViewPresenter.swift
//  football-iOS
//
//  Created by endo on 2021/10/29.
//  Copyright © 2021 endo. All rights reserved.
//

import Foundation

protocol HomeViewPresentation: AnyObject {

    func viewDidLoad()    
}


final class HomeViewPresenter {

    private weak var view: HomeView?
    private let router: HomeWireframe

    init(view: HomeView,
         router: HomeWireframe) {
        self.view = view
        self.router = router
    }
}

extension HomeViewPresenter: HomeViewPresentation {
    
    func viewDidLoad() {
        
    }
}

