//
//  SearchInteractor.swift
//  football-iOS
//
//  Created by endo on 2021/10/28.
//  Copyright © 2021 endo. All rights reserved.
//

import Foundation

protocol SearchUsecase {
    func fetchTeam(keyword: String,
                               completion: @escaping (Result<[SearchResult], Error>) -> Void)

}

final class SearchInteractor {
    private let client: FootballClientable

    init(client: FootballClientable = FootballClient()) {
        self.client = client
    }
}

extension SearchInteractor: SearchUsecase {



    func fetchTeam(keyword: String,
                           completion: @escaping (Result<[SearchResult], Error>) -> Void) {
        let request = FootballAPI.SearchTeams(keyword: keyword)
        client.send(request: request) { result in

            completion(result.map { $0.response })
        }
    }
}

