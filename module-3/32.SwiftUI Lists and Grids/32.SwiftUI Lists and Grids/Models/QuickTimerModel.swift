//
//  Q.swift
//  32.SwiftUI Lists and Grids
//
//  Created by Despo on 15.12.24.
//

import SwiftUI

struct QuickTimerModel: Identifiable, Codable {
    var id = UUID()
    let duration: TimeInterval
    let name: String
    
    func formatTime(from seconds: TimeInterval) -> String {
        let totalSeconds = Int(seconds)
        let minutes = (totalSeconds % 3600) / 60
        let secs = totalSeconds % 60
        
        return String(format: "%02d:%02d", minutes, secs)
    }
}
