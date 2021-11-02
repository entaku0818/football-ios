//
//  football-iOSViewController.swift
//  football-iOS
//
//  Created by endo on 2021/10/28.
//  Copyright © 2021 endo. All rights reserved.
//

import UIKit

protocol football-iOSView: AnyObject {
    
}

final class football-iOSViewController: UIViewController {
    
    var presenter: football-iOSViewPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension football-iOSViewController: football-iOSView {
    
}

