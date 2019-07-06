//
//  CheckProductListViewController.swift
//  LifeSport
//
//  Created by 遠藤拓弥 on 2019/02/02.
//  Copyright © 2019 LifeSports Inc. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Instantiate
import InstantiateStandard

class TeamDetailViewController: UIViewController, StoryboardInstantiatable{


    
    
    @IBOutlet weak var tableView: UITableView!


    struct Dependency {
        var team:Team
    }
    var team:Team!


    func inject(_ dependency: TeamDetailViewController.Dependency) {

        self.team = dependency.team

    }


    private let disposeBag = DisposeBag()
    lazy var viewModel: TeamDetailViewModel = {


        return TeamDetailViewModel(teamId: team.id)
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        

        viewModel.viewDidLoad.onNext(())

        bindViewModel()
    }

    override func loadView() {
        super.loadView()

        let teamDetailHeaderView:TeamDetailHeaderView = TeamDetailHeaderView.init(with: .init(team: team))
        tableView.tableHeaderView = teamDetailHeaderView
        tableView.register(UINib.init(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
    }
    


    override func viewWillAppear(_ animated: Bool) {
    }

    func bindViewModel() {

//        viewModel.productList
//            //.map{ $0 }
//            .bind(to: tableView.rx.items(cellIdentifier: "MyTalkCell", cellType: MyTalkCell.self)) { _, element, cell in
//                cell.talk = element
//            }.disposed(by: disposeBag)
        
        viewModel.players

            .bind(to: tableView.rx.items(cellIdentifier: "PlayerCell", cellType: PlayerCell.self)) { _, element, cell in
                cell.player = element
            }.disposed(by: disposeBag)

//        tableView.rx.modelSelected(Team.self)
//            .subscribe({ value in
//
//
//
//            })
//            .disposed(by: disposeBag)

    }
}



