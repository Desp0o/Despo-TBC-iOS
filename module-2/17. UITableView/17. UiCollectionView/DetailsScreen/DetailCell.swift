//
//  DetailCell.swift
//  17. UiCollectionView
//
//  Created by Despo on 19.10.24.
//

import UIKit

class DetailCell: UITableViewCell {
    private let propName = UILabel()
    private let propValue = UILabel()
    private let stack = UIStackView()
    private let mainView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none

        setupMainStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMainStack() {
        contentView.addSubview(mainView)
        
        mainView.isLayoutMarginsRelativeArrangement = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        
        setupLabelsStack()
}
    
    private func setupLabelsStack() {
        mainView.addArrangedSubview(stack)
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.white.cgColor
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 14, left: 8, bottom: 14, right: 8)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
            stack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
            stack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0),
        ])
        
        setupLabels()
    }
    
    private func setupLabels() {
        stack.addArrangedSubview(propName)
        stack.addArrangedSubview(propValue)
    }

    func configureDetailCell(propName: String, propValue: String) {
        self.propName.configureCustomLabel(with: propName, size: 18)
        self.propValue.configureCustomLabel(with: propValue, size: 18)
    }
}
