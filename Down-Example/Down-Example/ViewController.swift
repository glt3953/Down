//
//  ViewController.swift
//  Down-Example
//
//  Created by Keaton Burleson on 7/1/17.
//  Copyright © 2016-2019 Down. All rights reserved.
//

import UIKit
import Down

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let data = [
        ("人口", "患有LPR和患有咽喉部疾病的对照组"),
        ("样本量", "162"),
        ("方法", "Systematic Review"),
        ("结果", "上皮化、后息肉复发、返流发现评分、返流症状指数"),
        ("结论", "PPI治疗改善了LPR患者的手术结果并减少复发")
    ]
    var homeSwitchPopupView: HomeSwitchPopupView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        renderDownInWebView()
//        showHTMLContent()
        let popupViewButton = UIButton(frame: CGRect(x: 300, y: 44 + 20, width: 50, height: 30))
        popupViewButton.backgroundColor = .lightGray
        popupViewButton.setTitle("设置", for: .normal)
        popupViewButton.layer.cornerRadius = 5
        popupViewButton.layer.masksToBounds = true
        view.addSubview(popupViewButton)
        popupViewButton.addTarget(self, action: #selector(popupViewButtonClicked(_:)), for: .touchUpInside)
        // Set popupViewButton constraints
//        NSLayoutConstraint.activate([
//            popupViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 44 + 20),
//            popupViewButton.heightAnchor.constraint(equalToConstant: 30),
//            popupViewButton.widthAnchor.constraint(equalToConstant: 50),
//            popupViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
        
        showTableGrid()
    }
    
    @objc func popupViewButtonClicked(_ sender: UIButton) {
        if (homeSwitchPopupView == nil) {
            homeSwitchPopupView = HomeSwitchPopupView(frame: CGRect(x: 150, y: 120, width: 200, height: 100))
            view.addSubview(homeSwitchPopupView)
        }
        
        homeSwitchPopupView.isHidden = !homeSwitchPopupView.isHidden
    }
    
    func calculateTableViewHeight(cellWidth: CGFloat) -> CGFloat {
        var tableViewHeight : CGFloat = 0
        
        for (key, value) in data {
            tableViewHeight += CustomTableViewCell.heightForCell(title: key, value: value, width: cellWidth)
        }
        
        return tableViewHeight
    }
    
    func showTableGrid() {
        let containerView = UIView()
        containerView.backgroundColor = .lightGray
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false //此处设置可及时获得 frame 真实值
        view.addSubview(containerView)
        
        // Set containerView constraints
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44 + 20 + 200),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(32) + 10),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        // Force the layout to update immediately
        view.layoutIfNeeded()
        
        // Setup tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.separatorStyle = .none // Remove default separators
        tableView.backgroundColor = .white
        // 添加边框
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.darkGray.cgColor
        // 添加圆角
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false //此处设置可及时获得 frame 真实值
        containerView.addSubview(tableView)
        
        print("表格 containerView actual width: \(containerView.frame.width)")

        let tableViewHeight = calculateTableViewHeight(cellWidth: containerView.frame.size.width)
        print("表格高度：\(tableViewHeight)")
        // Set tableView constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            tableView.heightAnchor.constraint(equalToConstant: tableViewHeight),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
        // Force the layout to update immediately
        view.layoutIfNeeded()
        
//        var frame = view.bounds
//        frame.origin.x += 20
//        frame.origin.y += 44 + 10
//        frame.size.width -= 40
//        frame.size.height -= 44 + 20 + 32
//        let containerView = UIView(frame: frame)
//        containerView.backgroundColor = .lightGray
//        containerView.layer.cornerRadius = 10
//        containerView.layer.masksToBounds = true
//        view.addSubview(containerView)
//        
//        let tableVC = TableViewController()
//        addChild(tableVC)
//        containerView.addSubview(tableVC.view)
//        frame.origin.x = 10
//        frame.origin.y = 30
//        frame.size.width -= 20
//        frame.size.height = tableVC.calculateTableViewHeight(cellWidth: frame.size.width)
//        print("表格高度：\(frame.size.height)")
//        tableVC.view.frame = frame
//        tableVC.view.layer.cornerRadius = 10
//        tableVC.view.layer.masksToBounds = true
//        tableVC.didMove(toParent: self)
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let (title, value) = data[indexPath.row]
        cell.titleLabel.text = title
        cell.valueLabel.text = value
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

//    // UITableViewDelegate methods
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let (title, value) = data[indexPath.row]
//        let cellWidth = tableView.bounds.width
//        return CustomTableViewCell.heightForCell(title: title, value: value, width: cellWidth)
//    }
    
    func showHTMLContent() {
//        let gridHtml = """
//        <!DOCTYPE html>
//        <html lang="en">
//        <head>
//            <meta charset="UTF-8">
//            <meta name="viewport" content="width=device-width, initial-scale=1.0">
//            <title>Sample Table</title>
//            <style>
//                .markdown-body table {
//                  border-spacing: 0;
//                  border-collapse: separate;
//                  // width: 100%;
//                  min-width: 100%;
//                  // max-width: 100%;
//                  overflow: auto;
//                }
//                .share-table-wrapper,
//                .share-table-wrapper table {
//                  width: max-content;
//                }
//                .share-table-wrapper table {
//                  margin-bottom: 0 !important;
//                  border-collapse: unset !important;
//                  border-spacing: unset !important;
//                }
//                .share-table-wrapper table tr {
//                  border-top: none !important;
//                }
//                .share-table-wrapper table td {
//                  max-width: 260px !important;
//                  border: unset !important;
//                  border-bottom: 0.5px solid #d7d7d7 !important;
//                  border-right: 0.5px solid #d7d7d7 !important;
//                }
//                .share-table-wrapper table th {
//                  max-width: 260px !important;
//                  border: unset !important;
//                  border-top: 0.5px solid #d7d7d7 !important;
//                  border-bottom: 0.5px solid #d7d7d7 !important;
//                  border-right: 0.5px solid #d7d7d7 !important;
//                  text-align: center;
//                }
//                .share-table-wrapper table th:first-child {
//                  border-left: 0.5px solid #d7d7d7 !important;
//                  border-top-left-radius: 8px;
//                }
//                .share-table-wrapper table th:last-child {
//                  border-top-right-radius: 8px;
//                }
//                .share-table-wrapper table tbody tr td:first-child {
//                  border-left: 0.5px solid #d7d7d7 !important;
//                }
//                .share-table-wrapper table tbody tr:last-child td:first-child {
//                  border-bottom-left-radius: 8px;
//                }
//                .share-table-wrapper table tbody tr:last-child td:last-child {
//                  border-bottom-right-radius: 8px;
//                }
//                .share-table-wrapper table sup {
//                  display: none !important;
//                }
//                .default-table table {
//                  table-layout: fixed;
//                  margin-bottom: 0 !important;
//                  border-collapse: unset !important;
//                  border-spacing: unset !important;
//                }
//                .default-table table th {
//                  max-width: 260px !important;
//                  border: unset !important;
//                  border-top: 0.5px solid #d7d7d7 !important;
//                  border-bottom: 0.5px solid #d7d7d7 !important;
//                  border-right: 0.5px solid #d7d7d7 !important;
//                }
//                .default-table table th:first-child {
//                  border-left: 0px solid #d7d7d7 !important;
//                }
//                .default-table table th:last-child {
//                  border-right: 0px solid #d7d7d7 !important;
//                }
//                .default-table table td {
//                  max-width: 260px !important;
//                  border: unset !important;
//                  border-bottom: 0.5px solid #d7d7d7 !important;
//                  border-right: 0.5px solid #d7d7d7 !important;
//                }
//                .default-table table tbody tr td:first-child {
//                  border-left: 0px solid #d7d7d7 !important;
//                }
//                .default-table table tbody tr:last-child td:first-child {
//                  border-bottom-left-radius: 8px;
//                }
//                .default-table table tbody tr:last-child td:last-child {
//                  border-bottom-right-radius: 8px;
//                }
//                .default-table table tbody tr td:last-child {
//                  border-right: 0px solid #d7d7d7 !important;
//                }
//                .default-table table tbody tr:last-child td {
//                  border-bottom: 0px solid #d7d7d7 !important;
//                }
//                .markdown-body p:has(span[data-state="position-persist-bc"]) {
//                  display: none;
//                }
//                .markdown-body td,
//                .markdown-body th {
//                  padding: 0;
//                }
//            </style>
//        </head>
//        <body>
//
//        <h2>Sample Data Table</h2>
//
//        <table data-message-id="31364775" data-position-id="5_1_276_12_57_736" id="table_rendered_31364775_5_1_276_12_57_736" style="box-shadow: rgb(215, 215, 215) 0px 0px 0px 0.5px;"><thead><tr><th>食用油种类</th><th>不饱和脂肪酸含量</th><th>抗氧化性</th><th>烟点</th><th>适用烹饪方式</th><th>特点</th></tr></thead><tbody><tr><td><span>花生油</span></td><td><span>高，油酸含量丰富</span></td><td><span>较高</span></td><td><span>较高，适合高温烹饪</span></td><td><span>炒菜、煎炸</span></td><td><span>香味浓郁，耐高温</span></td></tr><tr><td><span>菜籽油</span></td><td><span>高，脂肪酸组成均衡</span></td><td><span>高</span></td><td><span>很高，适合高温烹饪</span></td><td><span>炒菜、煎炸</span></td><td><span>无特殊气味，脂肪酸组成均衡</span></td></tr><tr><td><span>葵花籽油</span></td><td><span>高，亚油酸含量丰富</span></td><td><span>较高</span></td><td><span>中等，适合中温烹饪</span></td><td><span>凉拌、烤食</span></td><td><span>维生素E含量高</span></td></tr><tr><td><span>玉米油</span></td><td><span>高，亚油酸含量丰富</span></td><td><span>较高</span></td><td><span>较高，适合高温烹饪</span></td><td><span>炸食、炒菜</span></td><td><span>维生素E含量高</span></td></tr><tr><td><span>橄榄油</span></td><td><span>高，油酸含量丰富</span></td><td><span>高</span></td><td><span>较低，更适合低温烹饪</span></td><td><span>凉拌、低温烹饪</span></td><td><span>富含单不饱和脂肪酸，口感清淡</span></td></tr><tr><td><span>芝麻油</span></td><td><span>高，油酸含量丰富</span></td><td><span>较高</span></td><td><span>低，更适合低温烹饪</span></td><td><span>凉拌、调味</span></td><td><span>香味浓郁，营养价值高</span></td></tr></tbody></table>
//
//        </body>
//        </html>
//        """
        let gridHtml = """
                <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <style>
                        table {
                            border-collapse: collapse;
                            width: 100%;
                            overflow: hidden;
                        }
                        th, td {
                            border: 1px solid #ddd;
                            padding: 8px;
                            background-color: #fff;
                            font-weight: normal; /* This makes sure the text is not bold */
                        }
                        th {
                            width: 80;
                            text-align: center;
                        }
                        td {
                            text-align: left;
                        }
                        th:first-child {
                            width: 100px;
                        }
                    </style>
                </head>
                <body>
                
                <table>
                    <tr>
                        <th>人口</th>
                        <td>患有LPR和患有咽喉部疾病的对照组</td>
                    </tr>
                    <tr>
                        <th>样本量</th>
                        <td>162</td>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <td>Systematic Review</td>
                    </tr>
                    <tr>
                        <th>结果</th>
                        <td>上皮化、后息肉复发、返流发现评分、返流症状指数</td>
                    </tr>
                    <tr>
                        <th>结论</th>
                        <td>PPI治疗改善了LPR患者的手术结果并减少复发</td>
                    </tr>
                </table>
                
                </body>
                </html>
                """
        var frame = view.frame
        frame.origin.x += 10
        frame.origin.y += 44 + 10
        frame.size.width -= 20
        frame.size.height -= 44 + 20 + 20
        let gridTextView = UITextView(frame: frame)
        gridTextView.isEditable = false
        // 设置背景颜色
        gridTextView.backgroundColor = UIColor.lightGray
        // 设置圆角
        gridTextView.layer.cornerRadius = 10
        // 使圆角效果生效
        gridTextView.layer.masksToBounds = true
        if let attributedString = try? NSAttributedString(data: Data(gridHtml.utf8), options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            gridTextView.attributedText = attributedString
        }
        view.addSubview(gridTextView)
    }
}

private extension ViewController {
    
    func renderDownInWebView() {
        guard let readMeURL = Bundle.main.url(forResource: "sample3", withExtension: "md"),
              let readMeContents = try? String(contentsOf: readMeURL)
        else {
            showError(message: "Could not load readme contents.")
            return
        }
        
        do {
            let downView = try DownView(frame: view.bounds, markdownString: readMeContents, didLoadSuccessfully: {
                print("Markdown was rendered.")
            })
            downView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(downView)
            constrain(subview: downView)
            createStatusBarBackgrounds(above: downView)
        } catch {
            showError(message: error.localizedDescription)
        }
    }
    
    func createStatusBarBackgrounds(above subview: UIView) {
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurEffectView, aboveSubview: subview)
        constrain(subview: blurEffectView, bottomAnchor: topLayoutGuide.bottomAnchor)
    }
    
    func constrain(subview: UIView, bottomAnchor: NSLayoutYAxisAnchor? = nil) {
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subview.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor ?? bottomLayoutGuide.bottomAnchor)
        ])
    }
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "DownView Render Error",
                                                message: message,
                                                preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
