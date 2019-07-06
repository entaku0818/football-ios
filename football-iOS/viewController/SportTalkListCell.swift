//
//  ChackProductCell.swift
//  LifeSport
//
//  Created by 遠藤拓弥 on 2019/01/11.
//  Copyright © 2019年 LifeSports Inc. All rights reserved.
//


import Foundation
import RxSwift
import Instantiate
import InstantiateStandard
import PINRemoteImage

class SportTalkListCell: UITableViewCell, Reusable, NibType{
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var teamImageView: UIImageView! {
        didSet {
            teamImageView.layer.cornerRadius = 4.0
            teamImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var teamNameLabel: UILabel!

    
    

    
    var team: Team? {
        didSet {
            guard let team:Team = team else { return }
            teamNameLabel.text = team.name
            debugPrint(team.crestUrl)
            teamImageView.setImageByPINRemoteImage(with: team.crestUrl)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        teamImageView.image = nil
        disposeBag = DisposeBag()
    }
}
