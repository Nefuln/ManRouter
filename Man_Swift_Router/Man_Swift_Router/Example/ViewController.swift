//
//  ViewController.swift
//  Man_Swift_Router
//
//  Created by jwn on 2017/3/14.
//  Copyright © 2017年 jwn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
    }

    @IBAction func next() {
        if let vc = ManRouter.shared.viewControllerFor(key: "second") {
            present(vc, animated: true, completion: nil)
        }
    }

}

