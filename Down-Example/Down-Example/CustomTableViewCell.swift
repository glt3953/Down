//
//  CustomTableViewCell.swift
//  Down-Example
//
//  Created by 宁侠 on 2024/12/13.
//  Copyright © 2024 Down. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let containerView = UIView()
    let horizontalSeparatorView = UIView()
    let titleLabel = UILabel()
    let valueLabel = UILabel()
    let verticalSeparatorView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        self.selectionStyle = .none // Disable cell selection effect
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.backgroundColor = .clear
        
        // Configure container view
        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.layer.cornerRadius = 10
//        containerView.layer.masksToBounds = true
        containerView.backgroundColor = .white
        
        // Configure horizontal separator view
        horizontalSeparatorView.backgroundColor = .lightGray
        horizontalSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure title label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        // Configure separator view
        verticalSeparatorView.backgroundColor = .lightGray
        verticalSeparatorView.translatesAutoresizingMaskIntoConstraints = false

        // Configure value label
        valueLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.numberOfLines = 0

        // Add subviews
        containerView.addSubview(horizontalSeparatorView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(verticalSeparatorView)
        containerView.addSubview(valueLabel)
        contentView.addSubview(containerView)

        // Set constraints for container view
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // Set constraints
        NSLayoutConstraint.activate([
            horizontalSeparatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            horizontalSeparatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            horizontalSeparatorView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            horizontalSeparatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            titleLabel.widthAnchor.constraint(equalToConstant: 100), // Fixed width for the first column
            
            verticalSeparatorView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            verticalSeparatorView.topAnchor.constraint(equalTo: containerView.topAnchor),
            verticalSeparatorView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            verticalSeparatorView.widthAnchor.constraint(equalToConstant: 0.5),

            valueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            valueLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            valueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
}
