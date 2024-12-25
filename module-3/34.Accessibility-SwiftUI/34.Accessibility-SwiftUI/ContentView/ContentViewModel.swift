//
//  ContentViewModel.swift
//  34.Accessibility-SwiftUI
//
//  Created by Despo on 25.12.24.
//

import Foundation
import AVFoundation
import Combine

@Observable
final class ContentViewModel: ObservableObject {
  var audioPlayer: AVAudioPlayer?
  var currentSongDuration: TimeInterval = 0
  var currentSongProgress: TimeInterval = 0
  var currentBackWardCount: TimeInterval = 0
  var isPlaying = false
  private var wasPaused = false
  private var musicCancellables: [UUID: AnyCancellable] = [:]
  private var backWardCancellables: [UUID: AnyCancellable] = [:]

  private var currentSongID = UUID()
  
  var mySongs: [SongModel] = [
    SongModel(cover: "muntity", name: "My Favorite Mutiny", author: "The Coup", songName: "mutiny"),
    SongModel(cover: "gunsNroses", name: "Paradise City", author: "Guns N' Roses", songName: "paradiseCity"),
    SongModel(cover: "hegotagame", name: "He Got Game", author: "Public Enemy", songName: "heGotGame"),
    SongModel(cover: "creedence", name: "Fortunate Son", author: "Creedence Clearwater Revival", songName: "fortunateSon"),
    SongModel(cover: "springfield", name: "Son Of A Preacher Man", author: "Dusty Springfield", songName: "sonOfPreacher"),
    SongModel(cover: "tribe", name: "Can I Kick", author: "A Tribe Called Quest", songName: "caniKick")
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
        currentBackWardCount = audioPlayer.duration

        audioPlayer.play()
        startMusicTimer(with: songID, duration: currentSongDuration)
        isPlaying = true
      }
    } catch {
      print("Failed to initialize audio player: \(error.localizedDescription)")
    }
  }
  
  func startMusicTimer(with id: UUID, duration: TimeInterval) {
    backwardCount()
    musicCancellables[id]?.cancel()
    musicCancellables[id] = Timer.publish(every: 0.5, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        if self?.currentSongProgress ?? 0 >= duration {
          self?.stopMusic(width: id)
        } else {
          self?.currentSongProgress += 0.5
        }
      }
  }
  
  func backwardCount() {
    backWardCancellables[currentSongID]?.cancel()
    backWardCancellables[currentSongID] = Timer.publish(every: 0.5, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        if self?.currentBackWardCount ?? 0 <= 0 {
          self?.stopMusic(width: self?.currentSongID ?? UUID())
        } else {
          self?.currentBackWardCount -= 0.5
        }
      }
  }
  
  func stopMusic(width id: UUID) {
    wasPaused = true
    musicCancellables[id]?.cancel()
    backWardCancellables[id]?.cancel()
  }
  
  func singleSong() -> SongModel? {
    guard let index = mySongs.firstIndex(where: { song in
      song.id == currentSongID
    }) else {
      return  nil
    }
    
    return mySongs[index]
  }
  
  func formatIntervalToSeconds(timeInterval: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second]
    var formattedTime = formatter.string(from: timeInterval) ?? "00:00"
    
    let minutes = Int(timeInterval) / 60
    let seconds = Int(timeInterval) % 60
    
    formattedTime = String(format: "%2d:%02d", minutes, seconds)
    
    return formattedTime
  }
  
  func getDurationtInMinutes() -> String {
    formatIntervalToSeconds(timeInterval: currentSongDuration)
  }
  
  func getBackwardInMinutes() -> String {
    formatIntervalToSeconds(timeInterval: currentBackWardCount)
  }
}

