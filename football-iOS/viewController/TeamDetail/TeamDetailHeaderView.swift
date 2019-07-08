//
//  ChackProductCell.swift
//  LifeSport
//
//  Created by 遠藤拓弥 on 2019/01/11.
//  Copyright © 2019年 LifeSports Inc. All rights reserved.
//


import Foundation
import Instantiate
import InstantiateStandard
import PINRemoteImage
import UIKit


class TeamDetailHeaderView: UIView, NibInstantiatable {

    var aiHandler: (() -> Void)?

    @IBAction func ai(_ sender: Any) {
        self.aiHandler?()


        let aiView:AIView = AIView.instantiate(with: ())

        aiView.frame = CGRect.init(x: UIScreen.main.bounds.width / 2 , y: UIScreen.main.bounds.height + 20, width: 100, height: 100)
        self.addSubview(aiView)

        UIView.animate(withDuration: 1.5, delay: 0.0, options: [], animations: {
            aiView.center.y -= (UIScreen.main.bounds.height + 20)
        }, completion: nil)
    }


    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var teamImageView: UIImageView!

    struct Dependency {
        var team:Team
    }
    var team:Team!

    @IBOutlet weak var aiButton: UIButton!

    func inject(_ dependency: TeamDetailHeaderView.Dependency) {

        self.team = dependency.team

        if team.id == 64 {
            teamNameLabel.text = team.name + "❤️❤️❤️"
            teamImageView.setImageByPINRemoteImage(with: URL.init(string: "https://pbs.twimg.com/profile_images/1070253948769054721/kvHt-oNl_400x400.jpg")! )
        }

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapProfileImage))
        //        self.profileImage.addGestureRecognizer(tapGestureRecognizer)
    }

    override func sizeToFit() {
        super.sizeToFit()
        let size: CGSize = self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        self.bounds.size = size
    }


}

