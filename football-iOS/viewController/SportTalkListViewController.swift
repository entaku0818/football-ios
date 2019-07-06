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

class SportTalkListViewController: UITableViewController,StoryboardInstantiatable{


    
    

 

    private let disposeBag = DisposeBag()
    lazy var viewModel: SportTalkListViewModel = {


        return SportTalkListViewModel()
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        

        viewModel.viewDidLoad.onNext(())
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
        bindViewModel()
    }

    override func loadView() {
        super.loadView()

        tableView.register(UINib.init(nibName: "SportTalkListCell", bundle: nil), forCellReuseIdentifier: "SportTalkListCell")
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
        
        viewModel.teams

            .bind(to: tableView.rx.items(cellIdentifier: "SportTalkListCell", cellType: SportTalkListCell.self)) { _, element, cell in
                cell.team = element
            }.disposed(by: disposeBag)

        

    }
}



