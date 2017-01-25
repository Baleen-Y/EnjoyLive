//
//  ELLiveListItem.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/25/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit
import Alamofire
import MJExtension

class ELLiveListItem: NSObject {
    
    // MARK: - 属性
    /// 主题名
    var subject: String = ""
    
    /// 参与人数
    var attendanceCount: Int = 0
    
    /// 是否需要付款
    var needPay: Bool = false
    
    /// 详情页面的背景图片 http
    var coverUrl: String = ""
    
    /// 金额
    var amount: Int = 0
    
    /// 最大人数
    var maxPeople: Int = 0
    
    /// 会话 ID
    var conversationId: String = ""
    
    /// 直播计划时间 2017-01-23 20:00:00
    var planTs: String = ""
    
    /// 直播开始时间
    var beginTs: String = ""
    
    /// 直播结束时间
    var endTs: String = ""
    
    /// 房主 ID
    var ownerId: Int = 0
    
    /// 直播创建时间
    var created: String = ""
    
    /// 更新时间
    var updated: String = ""
    
    /// 房主
    var owner: ELLiveOwnerItem = ELLiveOwnerItem()
    
    /// 是否能参与
    var canJoin: Bool = false
}


// MARK: - 自定义方法
extension ELLiveListItem {
    
    // 加载数据
    static func getListItems(_ complete:@escaping ([ELLiveListItem])->()) {
        Alamofire.request(ELLiveListURL).responseJSON { (dataResponse: DataResponse<Any>) in
            guard let JSON = dataResponse.result.value as? [String : Any] else{
                print("请求失败")
                return
            }
            guard let result = JSON["result"] else {
                return
            }
            ELLiveListItem.mj_setupObjectClass(inArray: { () -> [AnyHashable : Any]? in
                return [
                    "owner": "ELLiveOwnerItem"
                ]
            })
            let listItems = ELLiveListItem.mj_objectArray(withKeyValuesArray: result) as Array
            complete(listItems as! [ELLiveListItem])
        }
    }
    
}
