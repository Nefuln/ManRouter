//
//  AppDelegate.swift
//  Man_Swift_Router
//
//  Created by jwn on 2017/3/14.
//  Copyright © 2017年 jwn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 注册
        registerAllVC()
        
        return true
    }
    
    // MARK: Private
    private func registerAllVC() {
        ManRouter.shared.map(key: "first", cls: ViewController())
        ManRouter.shared.map(key: "second") { () -> UIViewController! in
            return UINavigationController(rootViewController: SecondVCViewController())
        }
        ManRouter.shared.map(key: "third", clsName: "ViewController")
    }

}

