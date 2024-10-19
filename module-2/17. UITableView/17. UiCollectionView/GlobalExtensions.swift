//
//  GlobalExtensions.swift
//  17. UiCollectionView
//
//  Created by Despo on 19.10.24.
//
import UIKit

extension UILabel {
    func screenTitle() {
        self.font = UIFont.boldSystemFont(ofSize: 36)
        self.textColor = UIColor.white
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
