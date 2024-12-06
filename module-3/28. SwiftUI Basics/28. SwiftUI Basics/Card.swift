//
//  Card.swift
//  28. SwiftUI Basics
//
//  Created by Despo on 06.12.24.
//

import SwiftUI

struct Card: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.gradientTop, .gradientBottom],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(width: 300, height: 400)
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
            
            VStack(spacing: 5) {
                UserPersonalInfo()
            }
            
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .padding(.bottom, 9)
    }
}

#Preview {
    Card()
}
