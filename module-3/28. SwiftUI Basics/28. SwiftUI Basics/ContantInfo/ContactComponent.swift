//
//  ContactComponent.swift
//  28. SwiftUI Basics
//
//  Created by Despo on 06.12.24.
//

import SwiftUI

struct ContactComponent: View {
    var icon: String
    
    var body: some View {
        HStack(spacing: 10){
            Image(icon)
                .frame(width: 40, height: 40)
        }
        .background(Color.black.opacity(0.2))
        .clipShape(Circle())
        .shadow(color: .black.opacity(0.9), radius: 5, x: 0, y: 4)
    }
}

#Preview {
    ContactComponent(icon: "phone")
}
