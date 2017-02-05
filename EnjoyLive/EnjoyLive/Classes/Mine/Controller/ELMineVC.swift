//
//  ELMineVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class ELMineVC: UIViewController {

    // MARK: - 属性
    /// 个人详情页背景
    var backImage: UIImage? {
        didSet {
            guard let image = backImage else {
                return
            }
            self.backImageView?.image = image
            let height = ELScreenWidth / image.size.width * image.size.height
            self.backImageView?.frame.size.height = height
            self.backImageToolbar?.frame = (self.backImageView?.bounds)!
        }
    }
    
    fileprivate var backImageView: UIImageView?
    fileprivate var backImageToolbar: UIToolbar?
    
    // MARK: - 重写系统方法
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
        backImage = #imageLiteral(resourceName: "EnjoyLive")
    }


}


// MARK: - 自定义方法
extension ELMineVC {
    
    /// 设置状态栏
    fileprivate func setupNavigation() {
        let navigationBar = navigationController?.navigationBar
        /// 设置状态栏透明
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
    
        /// 设置右侧设置按钮
        let settingBtn = UIBarButtonItem.highlightItem(#imageLiteral(resourceName: "navigationBar-setting"), nil, self, action: #selector(settingBtnClick))
        navigationItem.rightBarButtonItem = settingBtn
    }
    
    /// 设置界面
    fileprivate func setupUI() {
        /// 添加背景
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ELScreenWidth, height: 0))
        view.addSubview(imageView)
        backImageView = imageView
        
        /// 添加模糊层
        let toolBar = UIToolbar()
        imageView.addSubview(toolBar)
        toolBar.alpha = 0
        backImageToolbar = toolBar
        
        /// 添加主内容
        automaticallyAdjustsScrollViewInsets = false
        let mineTableVC = ELMineTableVC()
        addChildViewController(mineTableVC)
        let mineTableView = mineTableVC.tableView
        let y = ELStatusBarHeight + ELNavigationBarHeight
        let width = ELScreenWidth
        let height = ELScreenHeight - y - ELTabBarHeight
        mineTableView?.frame = CGRect(x: 0, y: y, width: width, height: height)
        view.addSubview(mineTableView!)
    }
    
    
    /// 设置按钮的点击
    @objc fileprivate func settingBtnClick() {
        ELPrint("settingBtnClick")
    }
}
