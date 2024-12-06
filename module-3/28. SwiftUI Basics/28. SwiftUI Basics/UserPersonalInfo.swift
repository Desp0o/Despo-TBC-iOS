//
//  UserPersonalInfo.swift
//  28. SwiftUI Basics
//
//  Created by Despo on 06.12.24.
//

import SwiftUI

struct UserPersonalInfo: View {
    @State var status = "Online"
    @State var statusColor: Color = .green
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment:.bottomTrailing) {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 5)
                    }
                    .frame(width: 105, height: 105)

                
                Text(status)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .font(.system(size: 10))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(statusColor)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

            }
            
            VStack(spacing: 5) {
                Text("John Doe")
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
    UserPersonalInfo()
}
