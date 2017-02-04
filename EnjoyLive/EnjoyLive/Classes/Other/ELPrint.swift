//
//  ELPrint.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/26/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit
/// 自定义 Log
func ELPrint<T>(_ message:T,
              file:String = #file,
              method:String = #function,
              line:Int = #line){
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)],\(method):\(message)")
    #endif
}

