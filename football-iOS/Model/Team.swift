//
//  TeamAPI.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2019/07/06.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation

struct Team:Decodable {
    let id:Int
    let name:String
    let shortName:String
    let crestUrl:URL
    let website:URL
    let venue:String
}
//"id": 57,
//"area": {
//    "id": 2072,
//    "name": "England"
//},
//"name": "Arsenal FC",
//"shortName": "Arsenal",
//"tla": "ARS",
//"crestUrl": "http://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg",
//"address": "75 Drayton Park London N5 1BU",
//"phone": "+44 (020) 76195003",
//"website": "http://www.arsenal.com",
//"email": "info@arsenal.co.uk",
//"founded": 1886,
//"clubColors": "Red / White",
//"venue": "Emirates Stadium",
//"lastUpdated": "2019-07-04T02:36:10Z"
