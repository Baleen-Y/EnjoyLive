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
        setupUI()
    }


}


// MARK: - 自定义方法
extension ELLiveVC {
    func setupUI() {
        // 设置导航栏头部
        let titleView = UIImageView(image: #imageLiteral(resourceName: "EnjoyLive"))
        titleView.sizeToFit()
        navigationItem.titleView = titleView
        // 创建列表控制器
        let listVC = ELLiveListTVC()
        let listView = listVC.view
        listView?.frame = CGRect(origin: CGPoint.zero, size: ELScreenBounds.size)
        addChildViewController(listVC)
//        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(listView!)
    }
}
