//
//  ELFeatureVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class ELFeatureVC: UIViewController {

    /// 重写父类方法
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let pictures = [#imageLiteral(resourceName: "One"), #imageLiteral(resourceName: "Two"), #imageLiteral(resourceName: "Three")]
        let pageView = ELFeaturePageView.pageView(pictures)
        pageView.frame = ELScreenBounds
        view.addSubview(pageView)
    }
    
    deinit {
        ELPrint("dead")
    }

}
