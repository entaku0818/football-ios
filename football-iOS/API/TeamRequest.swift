//
//  TeamAPI.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2019/07/06.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation
import APIKit

struct TeamsRequest:APIRequest {

    typealias Response = TeamsResponse
    let method: APIKit.HTTPMethod = .get
    var path: String {
        return "v2/competitions/PL/teams"
    }
    var headerFields: [String : String] {
        return ["X-Auth-Token": "9703d46d0a6c4e3f8f76ca1d17dcc150"]
    }
    var queryParameters: [String : Any]? {
        return [:]
    }


}

struct TeamRequest:APIRequest {


    typealias Response = TeamResponse
    let method: APIKit.HTTPMethod = .get
    var path: String {
        return "v2/competitions/PL/teams"
    }
    var headerFields: [String : String] {
        return ["X-Auth-Token": "9703d46d0a6c4e3f8f76ca1d17dcc150"]
    }

    let page: Int
    let token: String

}
