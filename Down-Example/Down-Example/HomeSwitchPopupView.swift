//
//  HomeSwitchPopupView.swift
//  Down-Example
//
//  Created by 宁侠 on 2024/12/16.
//  Copyright © 2024 Down. All rights reserved.
//

import UIKit

class HomeSwitchPopupView: UIView {
    var evidenceLabel: UILabel!
    var evidenceSwitch: UISwitch!
    var voiceLabel: UILabel!
    var voiceSwitch: UISwitch!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
//        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 5
        
        evidenceLabel = {
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 30))
            label.text = "循证"
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            return label
        }()
        self.addSubview(evidenceLabel)
        
        evidenceSwitch = {
            let toggleSwitch = UISwitch(frame: CGRect(x: 130, y: 10, width: 80, height: 30))
            toggleSwitch.onTintColor = .orange
            toggleSwitch.isOn = true
            return toggleSwitch
        }()
        self.addSubview(evidenceSwitch)
        
        voiceLabel = {
            let label = UILabel(frame: CGRect(x: 10, y: 60, width: 80, height: 30))
            label.text = "语音播报"
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            return label
        }()
        self.addSubview(voiceLabel)
        
        voiceSwitch = {
            let toggleSwitch = UISwitch(frame: CGRect(x: 130, y: 60, width: 80, height: 30))
            toggleSwitch.onTintColor = .gray
            toggleSwitch.isOn = false
            return toggleSwitch
        }()
        self.addSubview(voiceSwitch)
    }
    
    func setupConstraints() {
        evidenceLabel.translatesAutoresizingMaskIntoConstraints = false
        evidenceSwitch.translatesAutoresizingMaskIntoConstraints = false
        voiceLabel.translatesAutoresizingMaskIntoConstraints = false
        voiceSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            evidenceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            evidenceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            evidenceSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            evidenceSwitch.centerYAnchor.constraint(equalTo: evidenceLabel.centerYAnchor),
            
            voiceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            voiceLabel.topAnchor.constraint(equalTo: evidenceLabel.bottomAnchor, constant: 20),
            
            voiceSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            voiceSwitch.centerYAnchor.constraint(equalTo: voiceLabel.centerYAnchor),
            
            // Width constraints
            evidenceLabel.widthAnchor.constraint(equalToConstant: 80),
            voiceLabel.widthAnchor.constraint(equalToConstant: 80),
            
            // Height constraints
            evidenceLabel.heightAnchor.constraint(equalToConstant: 30),
            evidenceSwitch.heightAnchor.constraint(equalToConstant: 30),
            voiceLabel.heightAnchor.constraint(equalToConstant: 30),
            voiceSwitch.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
