//
//  CheckProductListViewModel.swift
//  LifeSport
//
//  Created by 遠藤拓弥 on 2019/02/02.
//  Copyright © 2019 LifeSports Inc. All rights reserved.
//


import Foundation
import RxSwift
import RxCocoa


class TeamDetailViewModel {
    


    private let disposeBag = DisposeBag()

    // input property
    var viewDidLoad: AnyObserver<Void>


    // output property
    var players: Observable<[Player]>
    


    init(teamId:Int,provider: TeamDetailDataProvider = TeamDetailDataProvider()) {
        let teamsRelay:BehaviorRelay = BehaviorRelay<[Player]>(value: [])
        let viewDidLoadSubject = PublishSubject<Void>()
        
        players = teamsRelay.asObservable()
        viewDidLoad = viewDidLoadSubject.asObserver()
        

        viewDidLoadSubject.asObservable()
            .flatMap{ _ in provider.getPlayers(teamId: teamId) }
            .flatMap { players -> Observable<[Player]> in

                return .just(players.squad)
            }.bind(to: teamsRelay)
            .disposed(by: disposeBag)
        


        
//        input.observable
//            .map { _ in productListRelay.value.count / self.totalPerPage }
//            .filter { $0 >= self.currentPage }
//            .map { _ in self.currentPage += 1 }
//            .flatMap { provider.getMyTalks(city_id: self.city_id!, sport_id: input.sportId, page: self.currentPage) }
//            .flatMap { Observable.from(optional: $0.result.talkrooms) }
//            .map { productListRelay.value + $0 }
//            .bind(to: productListRelay)
//            .disposed(by: disposeBag)

    }
    
}





