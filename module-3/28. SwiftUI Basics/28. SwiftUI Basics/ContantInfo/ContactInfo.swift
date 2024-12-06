//
//  ContactInfo.swift
//  28. SwiftUI Basics
//
//  Created by Despo on 06.12.24.
//

import SwiftUI

struct ContactInfo: View {
    private let icons = [
        "phone",
        "mail",
        "web",
    ]
    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(icons, id: \.self) { icon in
                ContactComponent(icon: icon)
            }
        }
    }
}

#Preview {
    ContactInfo()
}
