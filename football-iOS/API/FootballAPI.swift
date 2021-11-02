//
//  FootballAPI.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2021/10/28.
//  Copyright © 2021 遠藤拓弥. All rights reserved.
//


import Foundation
import APIKit


protocol FootballAPIRequest: Request {
    var strategy: JSONDecoder.KeyDecodingStrategy { get }
}

extension FootballAPIRequest {
    var headerFields: [String : String] {
        return
            [
                "X-RapidAPI-Key": "5306d81378msh9bc45e675c00cb3p14a5fajsnef007b957620",
                "x-rapidapi-host": "api-football-v1.p.rapidapi.com"
            ]
    }
    var baseURL: URL {
        return URL(string: "https://api-football-v1.p.rapidapi.com/v3")!
    }

    var strategy: JSONDecoder.KeyDecodingStrategy {
        return .convertFromSnakeCase
    }
}

extension FootballAPIRequest where Response: Decodable {
    var dataParser: DataParser {

        return DecodableDataParser() as DataParser
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = strategy
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(formatter)
        return try decoder.decode(Response.self, from: data)
    }

    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        print("-----RequestURL------")
        debugPrint(urlRequest.url ?? "URL is nil")
        return urlRequest
    }
}


final class FootballAPI {

    struct SearchTeams: FootballAPIRequest {

        typealias Response = SearchResponse

        let keyword: String

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/teams"
        }

        var parameters: Any? {
            return ["search": keyword]
        }
    }


}

