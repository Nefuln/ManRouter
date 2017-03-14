//
//  ManRouter.swift
//  Man_Swift_Router
//
//  Created by jwn on 2017/3/14.
//  Copyright © 2017年 jwn. All rights reserved.
//

import UIKit

final class ManRouter: NSObject {
    
    // 单例对象：保证在整个App运行过程中有效
    static let shared = ManRouter()
    private override init() {}
    
    // 存储键值的数组
    private var map = [String : AnyObject]()
    
    // 通过类名注册
    func map(key: String!, clsName: String!) {
        map[key] = clsName as AnyObject
    }
    
    // 通过VC对象注册
    func map(key: String!, cls: UIViewController!) {
        map[key] = cls;
    }
    
    // 通过block注册
    func map(key: String!, block: () -> UIViewController!) {
        map[key] = block();
    }
    
    // 获取控制器的方法
    func viewControllerFor(key: String?) -> UIViewController? {
        
        guard key != nil && map[key!] != nil else {
            return nil
        }
        
        var vc: UIViewController?
        
        vc = map[key!] is String ? obtainVC(className: map[key!] as! String) : map[key!] as? UIViewController
        
        return vc
    }

    // MARK:- Private
    // 通过类名获取类
    private func swiftClassName(className: String!) -> AnyClass? {
        guard let nameSpace = Bundle.main.infoDictionary?["CFBundleName"] as? String else {
            return nil
        }
        
        guard let swiftClass = NSClassFromString(nameSpace + "." + className) else {
            return nil
        }
        
        guard swiftClass is NSObject.Type else {
            return nil
        }
        
        return swiftClass
    }
    
    // 通过类名获取viewController
    private func obtainVC(className: String!) -> UIViewController? {
        
        let classType: AnyClass? = swiftClassName(className: className)
        
        guard classType is UIViewController.Type else {
            return nil
        }
        
        let vcClass = classType as! UIViewController.Type
        return vcClass.init()
        
    }
    
}
