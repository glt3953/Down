//
//  ViewController.swift
//  Down-Example
//
//  Created by Keaton Burleson on 7/1/17.
//  Copyright © 2016-2019 Down. All rights reserved.
//

import UIKit
import Down

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        renderDownInWebView()
//        showHTMLContent()
        showTableVC()
    }
    
    func showTableVC() {
        let tableVC = TableViewController()
        addChild(tableVC)
        view.addSubview(tableVC.view)
        var frame = view.bounds
        frame.origin.x += 10
        frame.origin.y += 44 + 10
        frame.size.width -= 20
        frame.size.height -= 44 + 20
        tableVC.view.frame = frame
        tableVC.view.layer.cornerRadius = 10
        tableVC.view.layer.masksToBounds = true
        tableVC.didMove(toParent: self)
    }
    
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
