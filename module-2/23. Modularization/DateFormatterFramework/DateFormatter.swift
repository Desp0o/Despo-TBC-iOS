//
//  DateFormatter.swift
//  19. web services
//
//  Created by Despo on 10.11.24.
//
import Foundation

public protocol DateFormattingProtocol {
    func formatDate(date: String) -> String
}

public final class DateFormatterLib: DateFormattingProtocol {
    
    public init() { }
    
    public func formatDate(date: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = inputFormatter.date(from: date) else { return String()}
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EEEE, MMMM dd yyyy"
        
        return outputFormatter.string(from: date)
    }
}
