


import Foundation
import RxSwift
import RxCocoa


class SportTalkListViewModel {
    


    private let disposeBag = DisposeBag()

    // input property
    var viewDidLoad: AnyObserver<Void>


    // output property
    var teams: Observable<[Team]>
    

    @IBOutlet var tapSetCondition: UITapGestureRecognizer!

    init(provider: TeamsProviderProvider = TeamsProviderProvider()) {
        let teamsRelay:BehaviorRelay = BehaviorRelay<[Team]>(value: [])
        let viewDidLoadSubject = PublishSubject<Void>()
        
        teams = teamsRelay.asObservable()
        viewDidLoad = viewDidLoadSubject.asObserver()
        

        viewDidLoadSubject.asObservable()
            .flatMap{ _ in provider.getTeams() }
            .flatMap { teams -> Observable<[Team]> in

                return .just(teams.teams)
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





