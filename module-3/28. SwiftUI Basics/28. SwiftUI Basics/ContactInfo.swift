//
//  ContactInfo.swift
//  28. SwiftUI Basics
//
//  Created by Despo on 06.12.24.
//

import SwiftUI

struct ContactInfo: View {
    let icons = [
        ContactComponent(icon: "phone"),
        ContactComponent(icon: "mail"),
        ContactComponent(icon: "web"),
    ]
    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(icons.indices, id: \.self) { index in
                icons[index]
            }
        }
    }
}

#Preview {
    ContactInfo()
}
