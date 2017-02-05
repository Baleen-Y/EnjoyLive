//
//  ELMineTableVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/26/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit
fileprivate let identifier = "mineCell"
class ELMineTableVC: UITableViewController {
    
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
    }
}
