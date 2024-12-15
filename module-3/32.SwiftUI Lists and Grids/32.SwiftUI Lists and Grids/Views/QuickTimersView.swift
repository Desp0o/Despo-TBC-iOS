//
//  QuickTimersView.swift
//  32.SwiftUI Lists and Grids
//
//  Created by Despo on 16.12.24.
//

import SwiftUI

struct QuickTimersView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var showModal: Bool
    
    var body: some View {
        VStack{
            HStack {
                Text("სწრაფი ტაიმერები")
                    .styledText(.white, 20, .bold)
                Spacer()
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(viewModel.quickTimersArray) { item in
                        Button {
                            viewModel.addQuickTimer(with: item)
                            showModal = false
                        } label: {
                            VStack(spacing: 8) {
                                Text( item.formatTime(from: item.duration))
                                    .styledText(.azure, 20, .bold)
                                
                                Text(item.name)
                                    .styledText(.white, 13, .regular)
                                    .frame(width: 78)
                                    .lineLimit(2)
                            }
                            .frame(width: 108, height: 94, alignment: .top)
                            .padding(.top, 24)
                            .background(.cardCol)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.top, 8)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.primaryCol)
    }
}

//#Preview {
//    QuickTimersView(showModal: true)
//        .environmentObject(ViewModel())
//}
