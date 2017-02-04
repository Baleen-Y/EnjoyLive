//
//  ELLiveListCell.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit
import YYWebImage

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
    
    var listItem: ELLiveListItem? {
        didSet {
            self.setupUI()
        }
    }

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
    
    
    fileprivate func setupUI() {
        guard let listItem = listItem else {
            return
        }
        // 设置标题
        subjectLabel.text = listItem.subject
        // 设置作者
        usernameLabel.text = listItem.owner.username
        // 设置参与人数
        attendanceCountLabel.text = listItem.attendanceCount.description
        // 设置价格
        let realAmount = listItem.amount / 100
        if realAmount == 0 {
            amountLabel.text = "免费"
        } else {
            amountLabel.text = "\(realAmount)"
        }
        // 设置头像
        avatarImageView.yy_setImage(with: listItem.owner.avatarUrl.url(), placeholder: #imageLiteral(resourceName: "EnjoyLive"))
        // 判断状态设置状态
        setupStatus(listItem)
    }
    
    /// 设置状态
    fileprivate func setupStatus(_ listItem: ELLiveListItem) {
        // 计划时间
        let planTime = listItem.planTs.date()
        // 更新时间(即当前时间)
        let updateTime = Date()
        // 结束时间
        let endTime = listItem.endTs.date()
        // 开始时间
        let beginTime = listItem.beginTs.date()
        
        statusLabel.isHidden = true
        statusImageView.isHidden = false
        // 比较时间
        
        if updateTime.isLiving(beginTime, endTime) { // 正在直播
            statusImageView.image = #imageLiteral(resourceName: "living")
        }else if updateTime.isEnd(planTime) { // 直播结束(由于还未直播的 endTime 和 beginTime 是给定的过去式，如果未在第一步，而这里返回是 true 则直播处于结束状态，和上面的顺序不能颠倒，因为这里才用的是'计划时间')
            statusImageView.image = #imageLiteral(resourceName: "rebroadcast")
        }else { // 直播还未开始
            statusImageView.isHidden = true
            statusLabel.isHidden = false
            var day: Int = 0
            var hour: Int = 0
            if planTime.isOutOneDay(updateTime, &day) {
                statusLabel.text = "\(day)天后直播开始"
            } else if planTime.isOutOneHour(updateTime, &hour) {
                statusLabel.text = "\(hour)小时后直播开始"
            } else {
                statusImageView.isHidden = false
                statusLabel.isHidden = true
                statusImageView.image = #imageLiteral(resourceName: "forthcoming")
            }
        }
    }
    
}
