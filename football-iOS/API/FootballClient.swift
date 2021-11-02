//
//  GitHubClient.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2021/10/28.
//  Copyright © 2021 遠藤拓弥. All rights reserved.
//

import Foundation
import APIKit

protocol FootballClientable: AnyObject {

    func send<T: FootballAPIRequest>(request: T, completion: @escaping (Result<T.Response, Error>) -> ())
}

class FootballClient: FootballClientable {

    func send<T>(request: T, completion: @escaping (Result<T.Response, Error>) -> ()) where T : FootballAPIRequest {

        APIKit.Session.send(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }

    }
}
