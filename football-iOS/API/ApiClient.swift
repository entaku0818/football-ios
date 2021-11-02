//
//  ApiClient.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2020/05/31.
//  Copyright © 2020 遠藤拓弥. All rights reserved.
//

import Foundation
import APIKit
import RxSwift

struct ApiClient {

    static func send<T: APIRequest>(_ request: T) -> Observable<T.Response> {
        return Single.create(subscribe: { event in
            APIKit.Session.send(request) { result in
                switch result {
                case .success(let response):
                    event(.success(response))
                case .failure(let error):
                    event(.error(error))
                }
            }
            return Disposables.create()
        }).asObservable()
    }

    static func send<T: APIRequest>(requestVoid: T) -> Observable<Void> {
        return Single.create(subscribe: { event in
            APIKit.Session.send(requestVoid) { result in
                switch result {
                case .success(let _):
                    event(.success(()))
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    event(.error(error))
                }
            }
            return Disposables.create()
        }).asObservable()
    }




}
