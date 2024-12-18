//
//  ContentView.swift
//  33. Gestures
//
//  Created by Despo on 18.12.24.
//

import SwiftUI

struct ContentView: View {
    @State var activeTab = 0
    
    var body: some View {
        TabView(selection: $activeTab) {
            Group{
                WheelSpin()
                    .tabItem {
                        Label("Wheel", image: activeTab == 0 ? "spinActive" : "spinInactive")
                    }
                    .tag(0)
                
                Hold()
                    .tabItem({
                        Label("Hold", image: activeTab == 1 ? "holdActive" : "holdInactive")
                    })
                    .tag(1)
                
                Rotate()
                    .tabItem({
                        Label("Hold", image: activeTab == 2 ? "rotateActive" : "rotateInactive")
                    })
                    .tag(2)
                
                Trash()
                    .tabItem({
                        Label("Hold", image: activeTab == 3 ? "trashActive" : "trashInactive")
                    })
                    .tag(3)
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        .tint(.customGreen)
        
    }
}

#Preview {
    ContentView()
}
