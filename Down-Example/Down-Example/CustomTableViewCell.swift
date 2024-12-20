//
//  CustomTableViewCell.swift
//  Down-Example
//
//  Created by 宁侠 on 2024/12/13.
//  Copyright © 2024 Down. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

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
    
    static func heightForCell(title: String, value: String, width: CGFloat) -> CGFloat {
        // Define padding and margins
        let verticalPadding: CGFloat = 8 + 8 // Top and bottom padding
        
        // Define fixed width for titleLabel
        let titleLabelWidth: CGFloat = 100
        
        // Create temporary labels to calculate sizes
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 0
        titleLabel.text = title
        
        let valueLabel = UILabel()
        valueLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.numberOfLines = 0
        valueLabel.text = value
        
        // Calculate the size for titleLabel
        let titleLabelSize = titleLabel.sizeThatFits(CGSize(width: titleLabelWidth, height: CGFloat.greatestFiniteMagnitude))
        
        // Calculate the size for valueLabel
        let valueLabelWidth = width - titleLabelWidth
        let valueLabelSize = valueLabel.sizeThatFits(CGSize(width: valueLabelWidth, height: CGFloat.greatestFiniteMagnitude))
        
        // Determine the maximum height needed
        let contentHeight = max(titleLabelSize.height, valueLabelSize.height)
        
        // Add vertical padding
        let totalHeight = contentHeight + verticalPadding
        
        print("表格行高：\(totalHeight)")
        return totalHeight
    }

    private func setupViews() {
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
        contentView.addSubview(horizontalSeparatorView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(verticalSeparatorView)
        contentView.addSubview(valueLabel)
        
        // Set constraints
        NSLayoutConstraint.activate([
            horizontalSeparatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalSeparatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalSeparatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            horizontalSeparatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            titleLabel.widthAnchor.constraint(equalToConstant: 100), // Fixed width for the first column
            
            verticalSeparatorView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            verticalSeparatorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalSeparatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalSeparatorView.widthAnchor.constraint(equalToConstant: 0.5),

            valueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
