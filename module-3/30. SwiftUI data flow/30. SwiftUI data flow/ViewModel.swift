//
//  ViewModel.swift
//  30. SwiftUI data flow
//
//  Created by Despo on 11.12.24.
//

import SwiftUI
import Combine
import AVFoundation

class ViewModel: ObservableObject {
    @Published var timersArray: [TimerModel] = [
        TimerModel(name: "ვარჯიში", duration: 2700, defaultDuration: 2700, isStarted: false),
        TimerModel(name: "იოგა", duration: 1600, defaultDuration: 1600, isStarted: false),
        TimerModel(name: "ძილი", duration: 5, defaultDuration: 5,  isStarted: false),
    ]
    
    var audioPlayer: AVAudioPlayer?
    private var timerCancellables: [UUID: AnyCancellable] = [:]
    private var feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    func startTimer(for timer: TimerModel) {
        guard let index = timersArray.firstIndex(where: { $0.id == timer.id }) else { return }
        
        feedbackGenerator.prepare()
        
        timersArray[index].isStarted = true
        
        if timersArray[index].duration == 0 {
            timersArray[index].duration = timer.defaultDuration
        }
        
        timerCancellables[timer.id]?.cancel()
        timerCancellables[timer.id] = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                if self?.timersArray[index].duration ?? 0 > 0 {
                    self?.timersArray[index].duration -= 1
                } else {
                    self?.playAudio()
                    self?.feedbackGenerator.impactOccurred()
                    print("🔴 feedbackGenerator.impactOccurred()")
                    self?.stopTimer(for: timer)
                }
            }
    }
    
    func stopTimer(for timer: TimerModel) {
        if let index = timersArray.firstIndex(where: { $0.id == timer.id }) {
            timersArray[index].isStarted = false
            timerCancellables[timer.id]?.cancel()
        }
    }
    
    func resetTimer(for timer: TimerModel) {
        if let index = timersArray.firstIndex(where: { $0.id == timer.id }) {
            timersArray[index].duration = timer.defaultDuration
            timersArray[index].isStarted = false
            timerCancellables[timer.id]?.cancel()
        }
    }
    
    func removeTimer(for timer: TimerModel) {
        if let index = timersArray.firstIndex(where: { $0.id == timer.id }) {
            timerCancellables[timer.id]?.cancel()
            timersArray.remove(at: index)
        }
    }
    
    func playAudio() {
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
}

