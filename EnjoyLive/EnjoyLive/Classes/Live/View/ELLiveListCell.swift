//
//  ELLiveListCell.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

fileprivate let identifier = "liveList"

class ELLiveListCell: UITableViewCell {
    
    // MARK: - 属性
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var attendanceCountLabel: UILabel!
    
    @IBOutlet weak var statusImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    

}

// MARK: - 自定义方法
extension ELLiveListCell {
    
    /// 获取 cell
    class func cell(_ tableView: UITableView) -> ELLiveListCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ELLiveListCell
        if cell == nil {
            tableView.register(UINib(nibName: "ELLiveListCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ELLiveListCell
        }
        return cell!
    }
}
