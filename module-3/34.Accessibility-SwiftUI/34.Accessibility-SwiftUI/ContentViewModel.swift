//
//  ContentViewModel.swift
//  34.Accessibility-SwiftUI
//
//  Created by Despo on 25.12.24.
//

import Foundation
import AVFoundation
import Combine

final class ContentViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    var currentSongDuration: TimeInterval = 0
    var currentSongProgress: TimeInterval = 0
    private var isPlaying = false
    private var wasPaused = false
    private var musicCancellables: [UUID: AnyCancellable] = [:]
    private var currentSongID = UUID()
    
    var mySongs: [SongModel] = [
        SongModel(cover: "muntity", name: "My Favorite Mutiny", author: "The Coup", songName: "mutiny"),
        SongModel(cover: "gunsNroses", name: "Paradise City", author: "Guns N' Roses", songName: "paradiseCity")
    ]
    
    func playAudio(with songName: String, and songID: UUID) {
        
        if currentSongID == songID, let audioPlayer = audioPlayer {
            isPlaying.toggle()
            if isPlaying {
                audioPlayer.play()
                startMusicTimer(with: songID, duration: currentSongDuration)
            } else {
                audioPlayer.pause()
                stopMusic(width: songID)
            }
            
            return
        }
        
        audioPlayer?.stop()
        currentSongProgress = 0
        stopMusic(width: currentSongID)
        currentSongID = songID
        
        guard let audioFilePath = Bundle.main.path(forResource: songName, ofType: "mp3") else {
            print("Audio file not found")
            return
        }
        
        let audioURL = URL(fileURLWithPath: audioFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            
            if let audioPlayer = audioPlayer {
                currentSongDuration = audioPlayer.duration
                print("Audio Duration: \(currentSongDuration) seconds")
                
                audioPlayer.play()
                startMusicTimer(with: songID, duration: currentSongDuration)
                isPlaying = true
            }
        } catch {
            print("Failed to initialize audio player: \(error.localizedDescription)")
        }
    }
    
    
    func startMusicTimer(with id: UUID, duration: TimeInterval) {
        musicCancellables[id]?.cancel()
        musicCancellables[id] = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                
                if self?.currentSongProgress ?? 0 >= duration {
                    self?.stopMusic(width: id)
                } else {
                    self?.currentSongProgress += 1
                    print(self?.currentSongProgress)
                }
            }
    }
    
    func stopMusic(width id: UUID) {
        wasPaused = true
        musicCancellables[id]?.cancel()
    }
}

