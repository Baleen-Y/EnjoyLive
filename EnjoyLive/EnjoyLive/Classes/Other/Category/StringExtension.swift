//
//  StringExtension.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/26/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

extension String {
    
    /// 快速获取字符串对应的 URL
    func url() -> URL? {
        guard let url = URL(string: self) else {
            return nil
        }
        return url
    }
    
    /// 快速获取字符串对应日期(格式: 2017-01-23 20:00:00)
    func date() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: self) ?? Date()
    }
}
