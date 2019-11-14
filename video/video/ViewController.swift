//
//  ViewController.swift
//  video
//
//  Created by Fromage Charley on 13/11/2019.
//  Copyright © 2019 Voodoo Coding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let services = Services()

    override func viewDidLoad() {
        super.viewDidLoad()

        services.getVideosList { videos, error in

        }
    }
}
