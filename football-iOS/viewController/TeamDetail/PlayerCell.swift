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

class PlayerCell: UITableViewCell, Reusable, NibType{
    
    var disposeBag = DisposeBag()
    

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    

    
    var player: Player? {
        didSet {
            guard let player:Player = player else { return }
            playerNameLabel.text = player.name
            positionLabel.text = player.position
            nationalityLabel.text = player.nationality
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
