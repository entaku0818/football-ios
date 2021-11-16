//
//  SearchViewPresenter.swift
//  football-iOS
//
//  Created by endo on 2021/10/28.
//  Copyright © 2021 endo. All rights reserved.
//

import Foundation

protocol SearchViewPresentation: AnyObject {

    func viewDidLoad()
    func searchButtonDidPush(searchText: String)
}


final class SearchViewPresenter {

    private weak var view: SearchView?
    private let router: SearchWireframe
    private let interactor: SearchUsecase
    
    init(view: SearchView,
         router: SearchWireframe,
         interactor: SearchUsecase) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchViewPresenter: SearchViewPresentation {
    
    func viewDidLoad() {
        
    }

    func searchButtonDidPush(searchText: String) {
        guard !searchText.isEmpty else { return }

        interactor.fetchTeam(keyword: searchText) { [weak self] result in
            switch result {
            case .success(let teams):

                self?.view?.updateTeams(teams)


            case .failure:
                self?.view?.showErrorAlert()
            }
        }

    }
}

