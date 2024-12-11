//
//  ContentView.swift
//  30. SwiftUI data flow
//
//  Created by Despo on 11.12.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            HStack(alignment: .firstTextBaseline, spacing: 15) {
                Text("ტაიმერები")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                ForEach($viewModel.timersArray) { $timer in
                    CardView(timer: $timer, viewModel: viewModel)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 15)
        .background(.primaryCol)
    }
}


struct CardView: View {
    @Binding var timer: TimerModel
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(timer.name)
                    .foregroundStyle(.white)
                    .font(.system(size: 18))
                
                Spacer()
                
                Button(action: {
                    viewModel.removeTimer(for: timer)
                }) {
                    Image("bin")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            
            HStack {
                Text(timer.formatTime(from: timer.duration))
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                    .foregroundStyle(.azure)
            }
            
            HStack {
                Button {
                    if timer.isStarted {
                        viewModel.stopTimer(for: timer)
                    } else {
                        viewModel.startTimer(for: timer)
                    }
                } label: {
                    Text(timer.isStarted ? "პაუზა" : "დაწყება")
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(timer.isStarted ? .pizzaz : .emerlad)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Button {
                    viewModel.resetTimer(for: timer)
                } label: {
                    Text("გადატვირთვა")
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.cardCol)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ContentView()
}
