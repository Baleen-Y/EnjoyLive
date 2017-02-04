//
//  ELChildVCItem.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class ELChildVCItem {
    
    /// 返回要主界面的子控制器(按顺序返回)
    ///
    /// - Returns: 子控制器数组
    class func getChildVCArr() -> [UIViewController] {
        // 1. 直播控制器
        let liveVC = ELLiveVC()
        let liveNav = addNavigation(liveVC, #imageLiteral(resourceName: "tabBar-live"), #imageLiteral(resourceName: "tabBar-liveSelected"), "直播")
        // 2. 空控制器(占位)
        let blankVC = UIViewController()
        // 3. 我的控制器
        let mineVC = ELMineVC()
        let mineNav = addNavigation(mineVC, #imageLiteral(resourceName: "tabBar-mine"), #imageLiteral(resourceName: "tabBar-mineSelected"), "我的")
        
        // 4. 返回
        return [liveNav, blankVC, mineNav]
    }
    
    static func addNavigation(_ rootVC: UIViewController, _ image: UIImage,_ selectedImage: UIImage, _ title: String) -> ELNavigationVC {
        let navVC = ELNavigationVC(rootViewController: rootVC)
        navVC.tabBarItem.image = image
        navVC.tabBarItem.selectedImage = selectedImage
        navVC.title = title
        navVC.topViewController?.title = title
        return navVC
    }
}
