//
//  ELTabBarVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class ELTabBarVC: UITabBarController {

    // MARK: - 重写系统方法
    override class func initialize() {
        super.initialize()
        setupTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildVC()
    }

}


// MARK: - 自定义方法
extension ELTabBarVC {
    
    /// 配置 tabBar
    class func setupTabBar() {
        // 修改 tabBarItem 样式
        var tabBarItem: UITabBarItem
        if #available(iOS 9.0, *) {
            tabBarItem = UITabBarItem.appearance(whenContainedInInstancesOf: [ELTabBarVC.self])
        } else {
            // Fallback on earlier versions
            tabBarItem = UITabBarItem.appearance()
        }
        let attNormal = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 11),
            NSForegroundColorAttributeName: ELNormalColor
        ]
        tabBarItem.setTitleTextAttributes(attNormal, for: .normal)
        let attSelected = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 11),
            NSForegroundColorAttributeName: ELSelectedColor
        ]
        tabBarItem.setTitleTextAttributes(attSelected, for: .selected)
        
        // 修改 tabBar 样式
        var tabBar: UITabBar
        if #available(iOS 9.0, *) {
            tabBar = UITabBar.appearance(whenContainedInInstancesOf: [ELTabBarVC.self])
        } else {
            // Fallback on earlier versions
            tabBar = UITabBar.appearance()
        }
        tabBar.backgroundImage = #imageLiteral(resourceName: "tabBar-background")
    }
    
    /// 配置子控制器
    func setupChildVC() {
        let childVCArr = ELChildVCItem.getChildVCArr()
        for childVC in childVCArr {
            addChildViewController(childVC)
        }
    }
    
}





