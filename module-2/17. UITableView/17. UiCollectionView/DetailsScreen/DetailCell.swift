//
//  DetailCell.swift
//  17. UiCollectionView
//
//  Created by Despo on 19.10.24.
//

import UIKit

class DetailCell: UITableViewCell {    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemTeal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
