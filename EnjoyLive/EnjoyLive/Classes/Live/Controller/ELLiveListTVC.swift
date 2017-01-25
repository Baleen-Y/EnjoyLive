//
//  ELLiveListTVC.swift
//  EnjoyLive
//
//  Created by Baleen.Y on 1/24/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

import UIKit

class ELLiveListTVC: UITableViewController {
    
    // MARK: - 属性
    var listItems: [ELLiveListItem] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
        // 获取数据
        ELLiveListItem.getListItems { (listItems: [ELLiveListItem]) in
            self.listItems = listItems
        }
    }
}

// MARK: - Table view data source
extension ELLiveListTVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ELLiveListCell.cell(tableView)
        cell.listItem = listItems[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ELLiveListCellH
    }
    
}
