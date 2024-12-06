//
//  UserPersonalInfo.swift
//  28. SwiftUI Basics
//
//  Created by Despo on 06.12.24.
//

import SwiftUI

struct UserPersonalInfo: View {
    @State private var statusColor: Color = .green
    @Binding var isActive: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment:.bottomTrailing) {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .clipShape(Circle())
                
                Text(isActive ? "online" : "offline")
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 10))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(isActive ? Color.green : Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
            }
            
            VStack(spacing: 5) {
                Text("Ninja Turtle")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                
                Text("iOS Developer")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 14))
                    .opacity(0.8)
            }
        }
    }
}

#Preview {
    @Previewable @State var isActive = true
    UserPersonalInfo(isActive: $isActive)
}
