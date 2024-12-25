//
//  ContentView.swift
//  34.Accessibility-SwiftUI
//
//  Created by Despo on 25.12.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    @State private var isProgressVisible = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.customRed, .customBlack],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 15) {
                Image("cover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .shadow(color: Color.black.opacity(0.6), radius: 6, x: 2, y: 4)
                
                VStack(spacing: 0) {
                    HStack {
                        Text("My Album")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image("hablo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 4)
                        
                        Text("Hablo Escobar")
                            .foregroundStyle(.customGray)
                        Spacer()
                    }
                }
                .padding(.horizontal, 15)
                
                List {
                    ForEach(vm.mySongs, id: \.self) { song in
                        MusicView(
                            cover: song.cover,
                            songName: song.name,
                            author: song.author
                        )
                        .listRowBackground(Color.clear)
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            vm.playAudio(with: song.songName, and: song.id)
                            isProgressVisible = true
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 15)
                .padding(.top, 30)
        
                Spacer()
                
                ProgressView()
                    .offset(y: isProgressVisible ? -50 : UIScreen.main.bounds.height)
                    .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0), value: isProgressVisible)

            }
            .padding(.top, 20)
        }
        .environment(vm)
    }
}

#Preview {
    ContentView()
}
