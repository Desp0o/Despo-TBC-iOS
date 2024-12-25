//
//  MusicView.swift
//  34.Accessibility-SwiftUI
//
//  Created by Despo on 25.12.24.
//

import SwiftUI

struct MusicView: View {
    let cover: String
    let songName: String
    let author: String
    
    var body: some View {
        HStack {
            Image(cover)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                Text(songName)
                    .foregroundStyle(.white)
                
                Text(author)
                    .foregroundStyle(.customGray)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .foregroundStyle(.white)
        }
    }
}
