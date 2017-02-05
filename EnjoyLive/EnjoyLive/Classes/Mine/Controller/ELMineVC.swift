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
    fileprivate var titleLabel: UILabel?

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
        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        /// 设置状态栏透明
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.clipsToBounds = true
        navigationItem.titleView = UIView() // 隐藏 title
        /// 添加文字
        let titleLabel = UILabel()
        titleLabel.text = "趣直播" // 这里用了死数据
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.sizeToFit()
        let centerX = navigationBar.frame.width * 0.5
        let centerY = navigationBar.frame.height + titleLabel.frame.height * 0.5
        titleLabel.center = CGPoint(x: centerX, y: centerY)
        navigationBar.addSubview(titleLabel)
        self.titleLabel = titleLabel
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
        toolBar.barStyle = .black
        imageView.addSubview(toolBar)
        toolBar.alpha = 0
        backImageToolbar = toolBar
        
        /// 添加主内容
        automaticallyAdjustsScrollViewInsets = false
        let mineTableVC = ELMineTableVC()
        mineTableVC.delegate = self
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

// MARK: - 代理方法
extension ELMineVC: ELMineTableVCDelegate {
    
    func mineTableViewDidScroll(_ mineTableView: UITableView) {
        let offsetY = mineTableView.contentOffset.y
        
        /// 模糊背景
        if offsetY > ELProfileTopMargin {
            /// 模糊背景
            let alpha = 0.9 * (offsetY - ELProfileTopMargin) / ELUsernameTopMargin
            backImageToolbar?.alpha = alpha
        } else if offsetY < ELProfileTopMargin {
            backImageToolbar?.alpha = 0
        }
        
        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        guard let titleLabel = titleLabel else {
            return
        }
        /// 状态栏文字显示的设置
        /// 文字要移动的距离
        let offsetLabel = navigationBar.frame.height * 0.5 + titleLabel.frame.height * 0.5
        let centerY = navigationBar.frame.height + titleLabel.frame.height * 0.5
        if offsetY > ELUsernameTopMargin && offsetY <= ELUsernameTopMargin + offsetLabel {
            
            /// 位移 title
            titleLabel.center.y = centerY - (offsetY - ELUsernameTopMargin)
        } else if offsetY < ELUsernameTopMargin {
            titleLabel.center.y = centerY
        } else { /// 防止滑动速度过快的 bug
            titleLabel.center.y = navigationBar.frame.height * 0.5
        }
        
        /// 背景图像的设置
        guard let backImageView = backImageView else {
            return
        }
        guard let backImage = backImage else {
            return
        }
        let imageH = ELScreenWidth / backImage.size.width * backImage.size.height
        let showHeight = ELProfileMargin + ELNavigationBarHeight + ELStatusBarHeight - offsetY
        let center = backImageView.center
        /// 如果偏移量小于 0 并且完全显示之后，拉伸图片
        if showHeight > imageH {
            /// 拉伸图片
            let width = showHeight / imageH * ELScreenWidth
            backImageView.frame.size.height = showHeight
            backImageView.frame.size.width = width
            backImageView.center = center
        } else {
            /// 还原
            let height = imageH
            backImageView.frame = CGRect(x: 0, y: 0, width: ELScreenWidth, height: height)
        }

    }
}
