//
//  ContentView.swift
//  33. Gestures
//
//  Created by Despo on 18.12.24.
//

import SwiftUI

struct WheelSpin: View {
    let vm = WheelViewModel()
    @State var spin: Double = 0
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<vm.colorCount, id: \.self) { index in
                    let startAngle = vm.createStartAngle(with: index)
                    let endAngle = vm.createEndAngle(with: index)
                    
                    WheelModel(
                        startAngle: .degrees(startAngle),
                        endAngle: .degrees(endAngle)
                    )
                    .fill(vm.colors[index % vm.colors.count])
                }
            }
            .rotationEffect(.degrees(spin))
            .gesture(
                DragGesture()
                    .onEnded{ value in
                        if value.translation.height > 100 {
                            withAnimation(.spring(response: 2.5, dampingFraction: 0.8)) {
                                spin += vm.makeWheelSpin()
                            }
                        }
                        
                    }
            )
        }
        .padding()
        .background(.customGreen)
    }
}

#Preview {
    WheelSpin()
}
