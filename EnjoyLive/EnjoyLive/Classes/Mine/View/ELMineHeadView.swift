//
//  ELMineHeadView.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 2/5/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class ELMineHeadView: UIView {

    // MARK: - 属性
    /// 头像宽度
    @IBOutlet weak var avatarImageViewWidth: NSLayoutConstraint!
    
    /// 头像
    @IBOutlet weak var avatarImageView: UIImageView!

    /// 用户名
    @IBOutlet weak var usernameLabel: UILabel!

    // MARK: - 类工厂方法
    class func headView() -> ELMineHeadView {
        let headView = Bundle.main.loadNibNamed("ELMineHeadView", owner: nil, options: nil)?.first as! ELMineHeadView
        return headView
    }
}
