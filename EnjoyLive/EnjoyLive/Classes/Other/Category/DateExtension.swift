//
//  DateExtension.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/26/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

extension Date {
    
    /// 判断直播是否已经结束
    func isEnd(_ endTime: Date) -> Bool {
        let result = self.compare(endTime)
        switch result {
        case .orderedAscending:
            return false
        case .orderedSame, .orderedDescending:
            return true
        }
    }
    
    /// 判断是否正在直播
    func isLiving(_ beginTime: Date, _ endTime: Date) -> Bool {
        let resultB = self.compare(beginTime)
        let resultE = self.compare(endTime)
        
        switch resultB {
        case .orderedAscending:
            return false
        case .orderedSame:
            return true
        default: break
            
        }
        
        switch resultE {
        case .orderedAscending:
            return true
        default:
            return false
        }
    }
    
    /// 判断是不是大于一天，如果大于一天将参数 day 赋值
    func isOutOneDay(_ updateTime: Date, _ day: inout Int) -> Bool {
        let calendar = Calendar.current
        let result = calendar.dateComponents([.day], from: updateTime, to: self)
        guard let resultDay = result.day else {
            return false
        }
        day = resultDay
        return true
    }
    /// 判断是不是大于一个小时(小于一天), 如果大于一个小时 hour 赋值
    func isOutOneHour(_ updateTime: Date, _ hour: inout Int) -> Bool {
        let calendar = Calendar.current
        let result = calendar.dateComponents([.hour], from: updateTime, to: self)
        guard let resultHour = result.hour else {
            return false
        }
        hour = resultHour
        return true
    }
    
}
