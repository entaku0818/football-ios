//
//  SearchTeam.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2021/10/28.
//  Copyright © 2021 遠藤拓弥. All rights reserved.
//

import Foundation


struct SearchResponse:Decodable {
    let response: [SearchResult]
}

struct SearchResult:Decodable {
    let team: SearchResultTeam
}

struct SearchResultTeam:Decodable {
    let id:Int
    let name:String
    let country:String?
    let founded:Int?
    let national:Bool?
    let logo:URL
}
