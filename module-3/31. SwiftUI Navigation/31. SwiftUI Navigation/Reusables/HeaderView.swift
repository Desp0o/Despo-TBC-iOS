//
//  SwiftUIView.swift
//  31. SwiftUI Navigation
//
//  Created by Despo on 13.12.24.
//

import SwiftUI

struct HeaderView: View {
    let name: String
    
    var body: some View {
        VStack(spacing: 50) {
            HStack(alignment: .firstTextBaseline, spacing: 15) {
                Text(name)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
        }
        .padding(.horizontal, 15)
        .background(.cardCol)
    }
}

#Preview {
    HeaderView(name: "test")
}
