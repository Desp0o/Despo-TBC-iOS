//
//  StringExtensions.swift
//  19. web services
//
//  Created by Despo on 30.10.24.
//

import UIKit

extension String {
    func formatDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = inputFormatter.date(from: self) else { return String()}
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        
        return outputFormatter.string(from: date)
    }
}
