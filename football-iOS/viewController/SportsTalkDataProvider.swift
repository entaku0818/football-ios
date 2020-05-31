

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
