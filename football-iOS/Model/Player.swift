//
//  TeamAPI.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2019/07/06.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation

struct Player: Decodable {
    let id:Int
    let name:String
    let position:String?
    let dateOfBirth:String
    let countryOfBirth:String
    let nationality:String
    let shirtNumber:String?
    let role:String
}
//"id": 1795,
//"name": "Alisson",
//"position": "Goalkeeper",
//"dateOfBirth": "1992-10-02T00:00:00Z",
//"countryOfBirth": "Brazil",
//"nationality": "Brazil",
//"shirtNumber": null,
//"role": "PLAYER"
