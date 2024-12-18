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
        showHTMLContent()
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
        
//        showTableGrid()
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
                
                <p>
                      
                      The somatostatin receptor subtype 2 (SSTR2) is often highly expressed on neuroendocrine tumors (NETs), making it a popular in vivo target for diagnostic and therapeutic approaches aimed toward management of NETs. In this work, an antagonist peptide (sst<sub>2</sub>-ANT) with high affinity for SSTR2 was modified at the N-terminus with a novel [N,S,O] bifunctional chelator (2) designed for tridentate chelation of rhenium(I) and technetium(I) tricarbonyl cores, [Re(CO)<sub>3</sub>]<sup>+</sup> and [<sup>99m</sup>Tc][Tc(CO)<sub>3</sub>]<sup>+</sup>. The chelator-peptide conjugation was performed via a Cu(I)-assisted click reaction of the alkyne-bearing chelator (2) with an azide-functionalized sst<sub>2</sub>-ANT peptide (3), to yield NSO-sst<sub>2</sub>-ANT (4). Two synthetic methods were used to prepare Re-4 at the macroscopic scale, which differed based on the relative timing of the click conjugation to the [Re(CO)<sub>3</sub>]<sup>+</sup> complexation by 2. The resulting products demonstrated the expected molecular mass and nanomolar in vitro SSTR2 affinity (IC<sub>50</sub> values under 30 nM, AR42J cells, [<sup>125</sup>I]iodo-Tyr<sup>11</sup>-somatostatin-14 radioligand standard). However, a difference in their HPLC retention times suggested a difference in metal coordination modes, which was attributed to a competing N-triazole donor ligand formed during click conjugation. Surprisingly, the radiotracer scale reaction of [<sup>99m</sup>Tc][Tc(OH<sub>2</sub>)<sub>3</sub>(CO)<sub>3</sub>]<sup>+</sup> (<sup>99m</sup>Tc; t<sub>½</sub> = 6 h, 141 keV γ) with 4 formed a third product, distinct from the Re analogues, making this one of the unusual cases in which Re and Tc chemistries are not well matched. Nevertheless, the [<sup>99m</sup>Tc]Tc-4 product demonstrated excellent in vitro stability to challenges by cysteine and histidine (≥98% intact through 24 h), along with 75% stability in mouse serum through 4 h. In vivo biodistribution and microSPECT/CT imaging studies performed in AR42J tumor-bearing mice revealed improved clearance of this radiotracer in comparison to a similar [<sup>99m</sup>Tc][Tc(CO)<sub>3</sub>]-labeled sst<sub>2</sub>-ANT derivative previously studied. Yet despite having adequate tumor uptake at 1 h (4.9% ID/g), tumor uptake was not blocked by co-administration of a receptor-saturating dose of SS-14. Aimed toward realignment of the Re and Tc product structures, future efforts should include distancing the alkyne group from the intended donor atoms of the chelator, to reduce the coordination options available to the [M(CO)<sub>3</sub>]<sup>+</sup> core (M = Re, <sup>99m</sup>Tc) by disfavoring involvement of the N-triazole.
                    </p>
                
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
        guard let readMeURL = Bundle.main.url(forResource: "latex", withExtension: "html"),
              let readMeContents = try? String(contentsOf: readMeURL)
        else {
            showError(message: "Could not load contents.")
            return
        }
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
