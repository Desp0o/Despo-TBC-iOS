//
//  ContentView.swift
//  32.SwiftUI Lists and Grids
//
//  Created by Despo on 15.12.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var name = ""
    @State var hours = ""
    @State var minutes = ""
    @State var seconds = ""
    @State private var showModal = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15) {
                HStack {
                    Text("ტაიმერები")
                        .styledText(.white, 24, .bold)
                    
                    Spacer()
                    
                    Button {
                        showModal.toggle()
                    } label: {
                        Image("plus")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 70, alignment: .leading)
                .padding(.horizontal, 15)
                .background(.cardCol)
                
                VStack(spacing: 50) {
                    ScrollView {
                        VStack {
                            ForEach($viewModel.timersArray) { $timer in
                                NavigationLink(destination: DetailsView(timer: timer)) {
                                    CardView(timer: $timer)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    VStack(spacing: 15) {
                        TextField("", text: $name, prompt: Text("ტაიმერის სახელი...").foregroundColor(.boulder))
                            .styledField()
                            .onChange(of: name) {newValue, oldValue in
                                name = newValue
                            }
                        
                        HStack(spacing: 10) {
                            TextField("", text: $hours, prompt: Text("სთ").foregroundColor(.boulder))
                                .styledField()
                                .onChange(of: hours) {newValue, oldValue in
                                    hours = newValue
                                }
                            
                            TextField("", text: $minutes, prompt: Text("წთ").foregroundColor(.boulder))
                                .styledField()
                                .onChange(of: minutes) {newValue, oldValue in
                                    minutes = newValue
                                }
                            
                            TextField("", text: $seconds, prompt: Text("წმ").foregroundColor(.boulder))
                                .styledField()
                                .onChange(of: seconds) {newValue, oldValue in
                                    seconds = newValue
                                }
                        }
                        
                        Button("დამატება") {
                            viewModel.addTimer(
                                name: name,
                                hh: hours,
                                mm: minutes,
                                ss: seconds
                            )
                            
                            name = ""
                            hours = ""
                            minutes = ""
                            seconds = ""
                        }
                        .foregroundStyle(.white)
                        .frame(width: 155, height: 42)
                        .background(.azure)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .frame(maxHeight: 130)
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 15)
            }
            .background(.primaryCol)
        }
        .navigationBarHidden(true)
        
        .sheet(isPresented: $showModal) {
            QuickTimersView(showModal: $showModal)
            .presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
