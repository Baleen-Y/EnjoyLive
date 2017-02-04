//
//  ELMineVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class ELMineVC: UIViewController {

    // MARK: - 重写系统方法
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
    }


}


// MARK: - 自定义方法
extension ELMineVC {
    
    /// 设置状态栏
    fileprivate func setupNavigation() {
        
        let settingBtn = UIBarButtonItem.highlightItem(#imageLiteral(resourceName: "navigationBar-setting"), nil, self, action: #selector(settingBtnClick))
        navigationItem.rightBarButtonItem = settingBtn
    }
    
    /// 设置界面
    fileprivate func setupUI() {
        let mineTableVC = ELMineTableVC()
        addChildViewController(mineTableVC)
        let mineTableView = mineTableVC.tableView
        mineTableView?.frame = CGRect(origin: CGPoint.zero, size: ELScreenBounds.size)
        view.addSubview(mineTableView!)
    }
    
    
    /// 设置按钮的点击
    @objc fileprivate func settingBtnClick() {
        ELPrint("settingBtnClick")
    }
}
