//
//  ImageView.swift
//  football-iOS
//
//  Created by 遠藤拓弥 on 2019/07/06.
//  Copyright © 2019 遠藤拓弥. All rights reserved.
//

import Foundation
import PINRemoteImage
import PINCache

import PocketSVG

extension UIImageView {

    func setImageByPINRemoteImage(with url: URL) {

        self.pin_setImage(from: url) { [weak self] result in
            // Success
            if result.error == nil, let image = result.image {
                debugPrint(image)
                self?.image = image

                // Failure
            } else {

                // error handling
            }

        }
    }
}
