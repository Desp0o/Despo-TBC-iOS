//
//  Card.swift
//  28. SwiftUI Basics
//
//  Created by Despo on 06.12.24.
//

import SwiftUI

struct Card: View {
    @State private var isActive = true
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.gradientTop, .gradientBottom],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(spacing: 20) {
                UserPersonalInfo(isActive: $isActive)
                ContactInfo()
                
                VStack(alignment: .leading) {
                    Skills()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                SliderButton(isActive: $isActive)
            }
        }
        .frame(width: 300)
        .padding(.vertical, 140)
    }
}

#Preview {
    Card()
}
