//
//  ContentView.swift
//  29. SwiftUI Essentials
//
//  Created by Despo on 09.12.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 23) {
                VStack(spacing: 15) {
                    Image("hablo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 102, height: 102)
                        .clipShape(Circle())
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 5)
                        .padding(.horizontal, 5)
                    
                    Text("Hablo Escobar")
                        .styledText(24, .black, .semibold)
                    
                    Text("iOS Developer | Swift Enthusiast | Tech Lover")
                        .styledText(15, .secondary, .semibold)
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 25)
    }
}


extension Text {
    func styledText(_ fontSize: CGFloat, _ textColor: Color = .black, _ weight: Font.Weight = .regular) -> some View {
        self
            .font(.system(size: fontSize))
            .fontWeight(weight)
            .foregroundStyle(textColor)
            .fixedSize()
    }
}

#Preview {
    ContentView()
}
