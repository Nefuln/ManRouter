
//
//  SecondVCViewController.swift
//  Man_Swift_Router
//
//  Created by jwn on 2017/3/14.
//  Copyright © 2017年 jwn. All rights reserved.
//

import UIKit

class SecondVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK:- Private
    
    ///初始化UI
    private func setupUI() {
        view.backgroundColor = UIColor.cyan
        addBtn()
    }
    
    /// 添加按钮
    private func addBtn() {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        btn.setTitle("跳转", for: .normal);
        btn.addTarget(self, action: #selector(next(sender:)), for: .touchUpInside)
        btn.center = view.center
        view.addSubview(btn)
    }
    
    // MARK:- Action
    
    /// 按钮点击事件
    func next(sender: UIButton?) {
        if let vc = ManRouter.shared.viewControllerFor(key: "third") {
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}
