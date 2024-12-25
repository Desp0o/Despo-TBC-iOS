//
//  ProgressView.swift
//  34.Accessibility-SwiftUI
//
//  Created by Despo on 25.12.24.
//

import SwiftUI

struct ProgressView: View {
    @EnvironmentObject var vm: ContentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)), Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1))],
                startPoint: .leading,
                endPoint: .trailing
            )
            
            VStack {
                Spacer()
                
                SUIProgressView(
                    currentProgres: $vm.currentSongProgress,
                    currentSongDuration: vm.currentSongDuration
                )
                .padding(.horizontal, 12)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 15)
        .frame(height: 50)
    }
    
    func printTes() {
        print(vm.currentSongProgress)
    }
}


struct SUIProgressView: UIViewRepresentable {
    @Binding var currentProgres: TimeInterval
    var currentSongDuration: TimeInterval
    
    func makeUIView(context: Context) -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0.0
        progressView.setProgress(Float(currentProgres), animated: true)
        progressView.tintColor = .white
        progressView.backgroundColor = .customBlack
        return progressView
    }
    
    func updateUIView(_ uiView: UIProgressView, context: Context) {
        let scaledProgress = Float(currentProgres / currentSongDuration)
        print(scaledProgress)
        UIView.animate(withDuration: 0.3) {
            uiView.setProgress(scaledProgress, animated: true)
        }
    }
}
