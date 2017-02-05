//
//  ELMineTableVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/26/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit
fileprivate let identifier = "mineCell"

protocol ELMineTableVCDelegate: NSObjectProtocol {
    
    /// 滚动 tableView 调用
    ///
    /// - Parameter mineTableView: tableView
    func mineTableViewDidScroll(_ mineTableView: UITableView)
}

class ELMineTableVC: UITableViewController {
    
    // MARK: - 属性
    var delegate: ELMineTableVCDelegate?
    var profileView: ELMineHeadView?
    
    // MARK: - 重写系统方法
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileUI()
    }
    
}


// MARK: - Table view data source
extension ELMineTableVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "趣直播新年大吉"
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let segmentedControl = UISegmentedControl(items: ["趣直播", "火火火"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor.white
        return segmentedControl
    }
}


// MARK: - 代理方法
extension ELMineTableVC {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        guard let profileView = profileView else {
            return
        }
        /// 偏移大于 20 小于 50 头像开始变化
        if offsetY > ELProfileTopMargin && offsetY <= ELProfileMargin {
            
            profileView.avatarImageViewWidth.constant = ELAvatarWidth - (offsetY - ELProfileTopMargin)
            
            
        }else if offsetY < ELProfileTopMargin {
            profileView.avatarImageViewWidth.constant = ELAvatarWidth
        }
        /// 其他操作
        guard let delegate = delegate else {
            return
        }
        delegate.mineTableViewDidScroll(tableView)
    }
    
}

// MARK: - 自定义方法
extension ELMineTableVC {
    
    /// 个人简介设置
    fileprivate func setupProfileUI() {
        tableView.backgroundColor = UIColor.clear
        tableView.sectionHeaderHeight = 38
        
        tableView.tableHeaderView = UIView()
        let headerView = tableView.tableHeaderView as UIView!
        let profileView = ELMineHeadView.headView()
        profileView.frame = CGRect(x: 0, y: 0, width: ELScreenWidth, height: ELProfileViewHeight)
        headerView?.frame = profileView.frame
        headerView?.addSubview(profileView)
        self.profileView = profileView
    }
}
