//
//  ELLiveVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//


/*
 为了拓展性这里选用了 UIViewController，然后再添加 UITableViewController 做法,
 我信你能做大，会越来越火!
 */

import UIKit

class ELLiveVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupNavigation()
        setupUI()
    }

}


// MARK: - 自定义方法
extension ELLiveVC {
    
    /// 设置导航栏
    fileprivate func setupNavigation() {
        /// 设置导航栏中部
        let titleView = UIImageView(image: #imageLiteral(resourceName: "EnjoyLive"))
        titleView.sizeToFit()
        navigationItem.titleView = titleView
        /// 设置导航栏右侧
        navigationItem.rightBarButtonItem = UIBarButtonItem.highlightItem(#imageLiteral(resourceName: "navigationBar-search"), nil, self, action: #selector(search))
    }
    
    /// 设置 UI
    fileprivate func setupUI() {
        
        /// 创建列表控制器
        let listVC = ELLiveListTVC()
        let listView = listVC.view
        listView?.frame = CGRect(origin: CGPoint.zero, size: ELScreenBounds.size)
        addChildViewController(listVC)
        view.addSubview(listView!)
    }
    
    
    /// 搜索按钮点击
    @objc fileprivate func search() {
        ELPrint("clickSearch")
    }
}
