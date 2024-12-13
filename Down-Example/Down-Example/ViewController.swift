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
        frame.origin.y += 10
        frame.size.width -= 20
        frame.size.height -= 20
        tableVC.view.frame = frame
        tableVC.didMove(toParent: self)
    }
    
    func showHTMLContent() {
        let gridHtml = """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Sample Table</title>
            <style>
                table {
                    width: 50%;
                    border-collapse: collapse;
                }
                th, td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                }
                th {
                    background-color: #f2f2f2;
                }
            </style>
        </head>
        <body>

        <h2>Sample Data Table</h2>

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Age</th>
                    <th>City</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Alice</td>
                    <td>30</td>
                    <td>New York</td>
                </tr>
                <tr>
                    <td>Bob</td>
                    <td>25</td>
                    <td>Los Angeles</td>
                </tr>
                <tr>
                    <td>Charlie</td>
                    <td>35</td>
                    <td>Chicago</td>
                </tr>
            </tbody>
        </table>

        </body>
        </html>
        """
//        let gridHtml = """
//                <!DOCTYPE html>
//                <html lang="en">
//                <head>
//                    <meta charset="UTF-8">
//                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
//                    <style>
//                        table {
//                            border-collapse: collapse;
//                            width: 100%;
//                            overflow: hidden;
//                        }
//                        th, td {
//                            border: 1px solid #ddd;
//                            padding: 8px;
//                            background-color: #fff;
//                            font-weight: normal; /* This makes sure the text is not bold */
//                        }
//                        th {
//                            width: 80;
//                            text-align: center;
//                        }
//                        td {
//                            text-align: left;
//                        }
//                        th:first-child {
//                            width: 100px;
//                        }
//                    </style>
//                </head>
//                <body>
//                
//                <table>
//                    <tr>
//                        <th>人口</th>
//                        <td>患有LPR和患有咽喉部疾病的对照组</td>
//                    </tr>
//                    <tr>
//                        <th>样本量</th>
//                        <td>162</td>
//                    </tr>
//                    <tr>
//                        <th>方法</th>
//                        <td>Systematic Review</td>
//                    </tr>
//                    <tr>
//                        <th>结果</th>
//                        <td>上皮化、后息肉复发、返流发现评分、返流症状指数</td>
//                    </tr>
//                    <tr>
//                        <th>结论</th>
//                        <td>PPI治疗改善了LPR患者的手术结果并减少复发</td>
//                    </tr>
//                </table>
//                
//                </body>
//                </html>
//                """
        let gridTextView = UITextView(frame: CGRect(x: 50, y: 100, width: 200, height: 500))
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
