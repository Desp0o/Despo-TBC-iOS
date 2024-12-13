//
//  DetailsView.swift
//  31. SwiftUI Navigation
//
//  Created by Despo on 13.12.24.
//

import SwiftUI

struct DetailsView: View {
    let timer: TimerModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                HeaderView(name: timer.name )
                
                VStack(spacing: 22) {
                    Image("timerIcon")
                    
                    Text("ხანგრძლივობა")
                        .foregroundStyle(.white)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                    
                    Text("\(timer.formatTime(from: timer.defaultDuration))")
                        .foregroundStyle(.azure)
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                }
                .padding(.vertical, 63)
                .background(.cardCol)
                .frame(maxWidth: .infinity)
                .background(.cardCol)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 15)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("აქტივობებების ისტორია")
                            .foregroundStyle(.white)
                            .font(.system(size: 18))
                        
                        Spacer()
                    }
        
                    Color.white.frame(width: .infinity, height: 1)
                    
                    HStack {
                        Text("თარიღი")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                        
                        Spacer()
                        
                        Text("დრო")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                    
                    HStack {
                        Text("\(Date.now)")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                        
                        Spacer()
                        
                        Text("დრო")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 15)
                .background(.cardCol)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal, 15)
            }
            .background(.primaryCol)
        }
    }
}

#Preview {
    DetailsView(timer: TimerModel(name: "Example Timer", duration: 2700, defaultDuration: 2700,isStarted: false, isPaused: false))
}
