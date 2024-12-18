//
//  TimerModel.swift
//  32.SwiftUI Lists and Grids
//
//  Created by Despo on 15.12.24.
//

import SwiftUI
import izziDateFormatter

struct TimerModel: Identifiable, Codable {
    var id = UUID()
    var name: String
    var duration: TimeInterval
    let defaultDuration: TimeInterval
    var isStarted: Bool = false
    var isPaused: Bool = false
    var sessionCount = 0
    var activity: [ActivityModel] = []
    
    func formatTime(from seconds: TimeInterval) -> String {
        let totalSeconds = Int(seconds)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let secs = totalSeconds % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, secs)
    }
    
    func fullActiveTime() -> String {
        let duration = Int(activity.reduce(0) { $0 + $1.activeDuration })
            let hours = duration / 3600
            let minutes = duration % 3600 / 60
            let seconds = duration % 60
            
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func groupedActivities() -> [String: [ActivityModel]] {
        return Dictionary(grouping: activity, by: { $0.date })
    }
}

struct ActivityModel: Identifiable, Codable {
    var id = UUID()
    var addedTime: String
    var date: String
    var activeDuration: TimeInterval
}
