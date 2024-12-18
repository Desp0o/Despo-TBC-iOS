//
//  CardView.swift
//  32.SwiftUI Lists and Grids
//
//  Created by Despo on 15.12.24.
//

import SwiftUI

struct CardView: View {
    @Binding var timer: TimerModel
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(timer.name)
                    .foregroundStyle(.white)
                    .font(.system(size: 18))
                    .lineLimit(1)
                    .padding(.trailing)
                
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
                    .styledText(.azure, 36, .bold)
            }
            
            HStack {
                Button {
                    if timer.isStarted {
                        viewModel.stopTimer(for: timer)
                    } else {
                        viewModel.startTimer(for: timer)
                    }
                } label: {
                    Text(timer.isStarted ? "პაუზა" : timer.isPaused ? "გაგრძელება" : "დაწყება")
                }
                .timerButtonStyles(bgColor: timer.isStarted ? .pizzaz : timer.duration == 0 ? .gray : .emerlad)
                .disabled(timer.duration == 0)
                
                Button {
                    viewModel.resetTimer(for: timer)
                } label: {
                    Text("გადატვირთვა")
                }
                .timerButtonStyles(bgColor: .red)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.cardCol)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
