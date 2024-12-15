//
//  DetailsView.swift
//  32.SwiftUI Lists and Grids
//
//  Created by Despo on 15.12.24.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ViewModel
    
    let timer: TimerModel
    
    var body: some View {
        VStack(spacing: 15) {
            VStack {
                HStack(alignment: .center) {
                    Button {
                        dismiss()
                    } label: {
                        Image("arrowBack")
                    }
                    
                    Spacer()
                    
                    Text(timer.name)
                        .styledText(.white, 24, .bold)
                    
                    Spacer()
                }
                .padding(.horizontal, 15)
                .frame(height: 50)
            }
            .background(.cardCol)
            
            VStack(spacing: 22) {
                Image("timerIcon")
                
                Text("ხანგრძლივობა")
                    .styledText(.white, 18, .regular)
                
                Text(timer.formatTime(from: timer.defaultDuration))
                    .styledText(.azure, 36, .bold)
            }
            .padding(.vertical, 63)
            .background(.cardCol)
            .frame(maxWidth: .infinity)
            .background(.cardCol)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 15)
            
            VStack(spacing: 10) {
                HStack {
                    Text("დღევანდელი სესიები")
                        .styledText(.dustyGray, 15, .bold)
                    Spacer()
                    Text("\(timer.sessionCount) სესია")
                        .styledText(.white, 15, .regular)
                }
                Divider()
                    .background(.boulder)
                
                HStack {
                    Text("საშუალო ხანგრძლივობა")
                        .styledText(.dustyGray, 15, .bold)
                    Spacer()
                    Text(viewModel.averageDuration(for: timer))
                        .styledText(.white, 15, .regular)
                }
                Divider()
                    .background(.boulder)
                
                HStack {
                    Text("ჯამური დრო")
                        .styledText(.dustyGray, 15, .bold)
                    Spacer()
                    Text(viewModel.durationSum(for: timer))
                        .styledText(.white, 15, .regular)
                }
                Divider()
                    .background(.boulder)
                
            }
            .padding(15)
            .background(.cardCol)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 15)
            
            VStack(spacing: 16) {
                ScrollView {
                    VStack(spacing: 15) {
                        HStack {
                            Text("აქტივობებების ისტორია")
                                .styledText(.white, 18)
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 8) {
                            ForEach(timer.activity) { act in
                                HStack {
                                    Text("\(act.date)")
                                        .styledText(.white, 14)
                                    
                                    Spacer()
                                    
                                    Text(timer.formatTime(from: act.activeDuration))
                                        .styledText(.white, 14)
                                        .frame(maxWidth: 62, alignment: .leading)
                                }
                            }
                        }
                    }
                }
                .frame(maxHeight: 350)
            }
            .padding(.top)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 15)
        }
        .padding(.bottom, 15)
        .background(.primaryCol)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DetailsView(timer: TimerModel(
        name: "test",
        duration: 227200,
        defaultDuration: 227200,
        isStarted: false,
        isPaused: false,
        activity: [
            ActivityModel(date: "13 Dec 2024", activeDuration: 222700),
            ActivityModel(date: "13 Dec 2024", activeDuration: 13)
        ]
    ))
    .environmentObject(ViewModel())
}
