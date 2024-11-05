//
//  TableColleCtionCell.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit

final class TableColleCtionCell: UICollectionViewCell {
    private var genre = UILabel()
    private let stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupCellUI() {
        contentView.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 12
        stack.backgroundColor = .purpleSecondary
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        stack.addArrangedSubview(genre)
        genre.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genre.centerYAnchor.constraint(equalTo: stack.centerYAnchor)
        ])
    }

    func configureCell(genre: String) {
        self.genre.configureMovieTitle(with: genre)
        self.genre.textColor = .purplePrimary
    }
    
}
