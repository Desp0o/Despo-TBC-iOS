//
//  ContentView.swift
//  30. SwiftUI data flow
//
//  Created by Despo on 11.12.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) { 
            HStack(alignment: .firstTextBaseline) {
                Text("ტაიმერები")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                Spacer()
            }
        }
        .padding(.horizontal, 15)
        .background(.primaryCol)
    }
    
        
}


#Preview {
    ContentView()
}
