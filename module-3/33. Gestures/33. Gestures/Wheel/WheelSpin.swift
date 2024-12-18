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
                ForEach(0..<vm.segmentCount, id: \.self) { index in
                    let startAngle = Double(index) / Double(vm.segmentCount) * 360
                    let endAngle = Double(index + 1) / Double(vm.segmentCount) * 360
                    
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
                            print("test")
                            withAnimation(.spring(response: 2.5, dampingFraction: 0.8)) {
                                spin += 360 * 5 + Double.random(in: 0..<360)
                            }
                        }
                        
                    }
            )
        }
        .padding()
    }
}

#Preview {
    WheelSpin()
}
