//
//  TableViewController.swift
//  Down-Example
//
//  Created by 宁侠 on 2024/12/13.
//  Copyright © 2024 Down. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let data = [
        ("人口", "患有LPR和患有咽喉部疾病的对照组"),
        ("样本量", "162"),
        ("方法", "Systematic Review"),
        ("结果", "上皮化、后息肉复发、返流发现评分、返流症状指数"),
        ("结论", "PPI治疗改善了LPR患者的手术结果并减少复发")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "研究结果"
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.separatorStyle = .none // Remove default separators
        tableView.backgroundColor = .lightGray
        tableView.contentInsetAdjustmentBehavior = .never // Adjust insets to avoid extra padding
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let item = data[indexPath.row]
        
        cell.titleLabel.text = item.0
        cell.valueLabel.text = item.1
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
