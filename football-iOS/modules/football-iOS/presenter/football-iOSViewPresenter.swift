//
//  football-iOSViewPresenter.swift
//  football-iOS
//
//  Created by endo on 2021/10/28.
//  Copyright © 2021 endo. All rights reserved.
//

import Foundation

protocol football-iOSViewPresentation: AnyObject {

    func viewDidLoad()    
}


final class football-iOSViewPresenter {

    private weak var view: football-iOSView?
    private let router: football-iOSWireframe
    private let interactor: football-iOSUsecase
    
    init(view: football-iOSView,
         router: football-iOSWireframe,
         interactor: football-iOSUsecase) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension football-iOSViewPresenter: football-iOSViewPresentation {
    
    func viewDidLoad() {
        
    }
}

