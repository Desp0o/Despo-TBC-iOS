//
//  Skills.swift
//  28. SwiftUI Basics
//
//  Created by Despo on 06.12.24.
//

import SwiftUI

struct Skills: View {
    private let skilArray = [
        "• SwiftUI",
        "• iOS Development",
        "• Problem Solving",
        "• UI/UX Design"
    ]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Skills")
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
            
            VStack(alignment: .leading, spacing: 5) {
                ForEach(skilArray, id: \.self) { skill in
                    Text(skill)
                        .foregroundStyle(Color.white)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    Skills()
}
