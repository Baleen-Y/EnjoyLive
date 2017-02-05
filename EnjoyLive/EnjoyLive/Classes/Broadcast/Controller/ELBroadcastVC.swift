//
//  ELBroadcastVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 2/5/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class ELBroadcastVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let cancel = UIButton(type: .system)
        cancel.setTitle("取消", for: .normal)
        cancel.addTarget(self, action: #selector(cancelClick), for: .touchUpInside)
        cancel.sizeToFit()
        cancel.center = view.center
        view.addSubview(cancel)
    }

    

}


// MARK: - 自定义方法
extension ELBroadcastVC {
    func cancelClick() {
        dismiss(animated: true, completion: nil)
    }
}
