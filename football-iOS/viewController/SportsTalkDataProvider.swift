//
//  MyCommunityDataProvider.swift
//  LifeSport
//
//  Created by 田中 厳貴 on 2019/02/26.
//  Copyright © 2019年 LifeSports Inc. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

protocol TeamsProviderProtocol {
    func getTeams() -> Observable<TeamsResponse>

}

class TeamsProviderProvider: TeamsProviderProtocol {


    func getTeams() -> Observable<TeamsResponse> {
//       guard let apiToken = Session.accessToken else { return .empty() }
       

        return ApiClient.send(TeamsRequest())
    }

}
