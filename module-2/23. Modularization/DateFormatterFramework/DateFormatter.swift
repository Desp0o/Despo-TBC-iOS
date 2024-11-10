//
//  DateFormatter.swift
//  19. web services
//
//  Created by Despo on 10.11.24.
//
import Foundation

public class DateFormatterFramework {
    
    public init() { }
    
    public func formatDate(date: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = inputFormatter.date(from: date) else { return String()}
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        
        return outputFormatter.string(from: date)
    }
}
