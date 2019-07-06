//
//  TeamAPI.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2019/07/06.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation

    struct TeamsResponse:Decodable {

        let teams: [Team]

    }

    struct TeamResponse:Decodable {

        let teams: Team

    }

struct PlayersResponse:Decodable {

    let squad: [Player]

}
