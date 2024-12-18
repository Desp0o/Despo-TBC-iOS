//
//  Hold.swift
//  33. Gestures
//
//  Created by Despo on 18.12.24.
//

import SwiftUI

struct Hold: View {
    @State private var isCleared: Bool = false
    let vm = WheelViewModel()
    
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
                    .fill(isCleared ? Color.clear : vm.colors[index % vm.colors.count])
                    .overlay(
                        WheelModel(
                            startAngle: .degrees(startAngle),
                            endAngle: .degrees(endAngle)
                        )
                        .stroke(
                            Color.black,
                            style: StrokeStyle(lineWidth: 1)
                        )
                    )
                    .animation(.easeInOut(duration: 0.5), value: isCleared)
                }
            }
            .onLongPressGesture(minimumDuration: 5) {
                isCleared = true
            } onPressingChanged: { pressing in
                if !pressing {
                    isCleared = false
                }
            }
        }
        .padding()
        .background(.customGreen)
    }
}

#Preview {
    Hold()
}
