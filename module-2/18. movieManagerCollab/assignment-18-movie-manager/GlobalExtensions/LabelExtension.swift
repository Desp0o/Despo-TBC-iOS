//
//  LabelExtension.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit

extension UILabel {
    func configureSeocndaryText(with text: String) {
        self.font = UIFont(name: "Mulish-Regular", size: 12)
        self.textColor = .secondarytext
        self.text = text
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureMovieTitle(with text: String) {
        self.font = UIFont(name: "Mulish-Bold", size: 14)
        self.textColor = .black
        self.text = text
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureSectionHeader(with text: String) {
        self.font = UIFont(name: "Merriweather-Black", size: 16)
        self.textColor = .darkBlue
        self.text = text
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
