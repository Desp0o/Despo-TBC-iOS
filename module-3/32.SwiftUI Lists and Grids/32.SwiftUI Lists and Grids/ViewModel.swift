//
//  ViewModel.swift
//  32.SwiftUI Lists and Grids
//
//  Created by Despo on 15.12.24.
//

import SwiftUI
import Combine
import AVFoundation
import izziDateFormatter

class ViewModel: ObservableObject {
    private let izziFormater: IzziDateFormatterProtocol
    var audioPlayer: AVAudioPlayer?
    private var timerCancellables: [UUID: AnyCancellable] = [:]
    private var feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private var activityDurationCount = 0
    
    var quickTimersArray = [
        QuickTimerModel(duration: 180, name: "ჩაის დაყენება"),
        QuickTimerModel(duration: 600, name: "კვერცხის მოხარშვა"),
        QuickTimerModel(duration: 300, name: "პურს გამოცხობა"),
        QuickTimerModel(duration: 900, name: "შებრაწვა"),
        QuickTimerModel(duration: 1200, name: "ფოთლის ჩაის გაკეთება"),
        QuickTimerModel(duration: 1500, name: "მკვახე ქათმის მოსამზადებელი დრო"),
        QuickTimerModel(duration: 1800, name: "ვაშლის პიურე"),
        QuickTimerModel(duration: 600, name: "მოამზადე კექსი"),
        QuickTimerModel(duration: 900, name: "ვეგეტარიანული შაურმა"),
        QuickTimerModel(duration: 1200, name: "ხორცის დამზადება"),
        QuickTimerModel(duration: 1500, name: "პიცის გამოცხობა"),
        QuickTimerModel(duration: 1800, name: "სუშის მომზადება"),
        QuickTimerModel(duration: 300, name: "პასტის მოხარშვა"),
        QuickTimerModel(duration: 900, name: "მალიბი წისქვილის გაკეთება"),
        QuickTimerModel(duration: 600, name: "კარტოფილის პიურე"),
        QuickTimerModel(duration: 1200, name: "ყავის მომზადება"),
        QuickTimerModel(duration: 300, name: "ლუბიას მოხარშვა"),
        QuickTimerModel(duration: 900, name: "ნაყინის დამზადება"),
        QuickTimerModel(duration: 600, name: "ბურგერის მომზადება"),
        QuickTimerModel(duration: 300, name: "ხახვის დაჭრა")
    ]
    
    @Published var timersArray: [TimerModel] = [
        TimerModel(name: "ძილი", duration: 5, defaultDuration: 5,  isStarted: false),
    ] {
        didSet {
            saveTimers()
        }
    }
    
    init(izziFormater: IzziDateFormatterProtocol = IzziDateFormatter())
    {
        self.izziFormater = izziFormater
        self.loadTimers()
    }
    
    func addTimer(name: String, hh: String, mm: String, ss: String) {
        let validHours = Int(hh) ?? 0
        let validMinutes = Int(mm) ?? 0
        let validSeconds = Int(ss) ?? 0
        
        let hours = validHours * 3600
        let minutes = validMinutes * 60
        let interval = hours + minutes + validSeconds
        
        let currentTimer = TimerModel(
            name: name,
            duration: TimeInterval(interval),
            defaultDuration: TimeInterval(interval),
            isStarted: false
        )
        
        timersArray.append(currentTimer)
    }
    
    func startTimer(for timer: TimerModel) {
        guard let index = timersArray.firstIndex(where: { $0.id == timer.id }) else { return }
        feedbackGenerator.prepare()
        
        timersArray[index].isStarted = true
        timersArray[index].sessionCount += 1
        
        if timersArray[index].duration == 0 {
            timersArray[index].duration = timer.defaultDuration
        }
        
        timerCancellables[timer.id]?.cancel()
        timerCancellables[timer.id] = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                if let index = self?.timersArray.firstIndex(where: { $0.id == timer.id }) {
                    if self?.timersArray[index].duration ?? 0 > 0 {
                        self?.timersArray[index].duration -= 1
                        self?.activityDurationCount += 1
                    } else {
                        self?.playAudio()
                        self?.feedbackGenerator.impactOccurred()
                        print("🔴 feedbackGenerator.impactOccurred()")
                        self?.stopTimer(for: timer)
                        self?.timersArray[index].isPaused = false
                    }
                }
            }
    }
    
    func stopTimer(for timer: TimerModel) {
        if let index = timersArray.firstIndex(where: { $0.id == timer.id }) {
            addActivityToTimer(with: index)
            activityDurationCount = 0
            
            timersArray[index].isStarted = false
            timersArray[index].isPaused = true
            timerCancellables[timer.id]?.cancel()
        }
    }
    
    func resetTimer(for timer: TimerModel) {
        if let index = timersArray.firstIndex(where: { $0.id == timer.id }) {
            //            addActivityToTimer(with: index)
            activityDurationCount = 0
            
            timersArray[index].duration = timer.defaultDuration
            timersArray[index].isStarted = false
            timersArray[index].isPaused = false
            timerCancellables[timer.id]?.cancel()
        }
    }
    
    func removeTimer(for timer: TimerModel) {
        if let index = timersArray.firstIndex(where: { $0.id == timer.id }) {
            timerCancellables[timer.id]?.cancel()
            timersArray.remove(at: index)
        }
    }
    
    func averageDuration(for timer: TimerModel) -> String {
        var average = 0
        if let index = timersArray.firstIndex(where: { $0.id == timer.id }) {
            guard timersArray[index].sessionCount > 0 else { return "00:00:00"}
            
            average = timersArray[index].activity.reduce(0) { $0 + Int($1.activeDuration) } / timersArray[index].sessionCount
        }
        
        let hours = average / 3600
        let minutes = (average % 3600) / 60
        let seconds = average % 60
        
        if hours > 0 {
            return String(format: "%0d საათი", hours, minutes)
        } else if minutes > 0 {
            return String(format: "%0d წუთი", minutes, seconds)
        } else {
            return String(format: "%0d წამი", seconds)
        }
    }
    
    func durationSum(for timer: TimerModel) -> String {
        var sum = 0
        
        if let index = timersArray.firstIndex(where: { $0.id == timer.id }) {
            sum = timersArray[index].activity.reduce(0) { $0 + Int($1.activeDuration) }
        }
        
        let hours = sum / 3600
        let minutes = (sum % 3600) / 60
        let seconds = sum % 60
        
        if hours > 0 {
            return String(format: "%0d სთ %0d წთ", hours, minutes)
        } else if minutes > 0 {
            return String(format: "%0d წთ %0d წმ", minutes, seconds)
        } else {
            return String(format: "%0d წმ", seconds)
        }
    }
    
    func addActivityToTimer(with index: Int) {
        let currentDateISO = ISO8601DateFormatter().string(from: Date.now)
        let formattedDate = izziFormater.isoTimeFormatter(
            currentDate: currentDateISO,
            finalFormat: "dd MMM yyyy",
            timeZoneOffset: 4,
            localeIdentifier: "ka_GE"
        )
        
        let currentTime = izziFormater.isoTimeFormatter(
            currentDate: currentDateISO,
            finalFormat: "HH:mm",
            timeZoneOffset: 4,
            localeIdentifier: "ka_GE"
        )
        
        let activity = ActivityModel(addedTime: currentTime, date: formattedDate, activeDuration: TimeInterval(activityDurationCount))
        
        timersArray[index].activity.append(activity)
    }
    
    func addQuickTimer(with quickTimer: QuickTimerModel) {
        if let index = quickTimersArray.firstIndex(where: { $0.id == quickTimer.id }) {
            let currentTimer = quickTimersArray[index]
            
            let newTimer = TimerModel(name: currentTimer.name, duration: currentTimer.duration, defaultDuration: currentTimer.duration)
            timersArray.append(newTimer)
        }
    }
    
    private func playAudio() {
        guard let audioFilePath = Bundle.main.path(forResource: "timeOver", ofType: "mp3") else {
            print("Audio file not found")
            return
        }
        
        let audioURL = URL(fileURLWithPath: audioFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.play()
        } catch {
            print("Failed to initialize audio player: \(error.localizedDescription)")
        }
    }
    
    private func saveTimers() {
        if let encodedTimer = try? JSONEncoder().encode(timersArray) {
            UserDefaults.standard.set(encodedTimer, forKey: "timers")
        }
    }
    
    private func loadTimers() {
        if let savedTimers = UserDefaults.standard.data(forKey: "timers"),
           var decodedTimers = try? JSONDecoder().decode([TimerModel].self, from: savedTimers) {
            decodedTimers = decodedTimers.map { timer in
                var updatedTimer = timer
                updatedTimer.isStarted = false
                return updatedTimer
            }
            timersArray = decodedTimers
        }
    }
}
