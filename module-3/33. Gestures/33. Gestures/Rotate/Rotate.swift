//
//  Rotate.swift
//  33. Gestures
//
//  Created by Despo on 18.12.24.
//

import SwiftUI

struct Rotate: View {
    @State var value = Angle(degrees: 0)
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Image("calc")
                .rotationEffect(value)
                .scaleEffect(scale)
                .gesture(
                    SimultaneousGesture(
                        RotationGesture()
                            .onChanged { angle in
                                value = angle
                            }
                            .onEnded { _ in
                                withAnimation(.easeOut(duration: 0.5)) {
                                    value = Angle(degrees: 0)
                                }
                            },
                        
                        MagnificationGesture()
                            .onChanged { value in
                                scale = min(max(0.5, value), 2.0)
                            }
                            .onEnded { _ in
                                withAnimation(.easeOut(duration: 0.5)) {
                                    scale = 1.0
                                }
                            }
                    )
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.customGreen)
    }
}

#Preview {
    Rotate()
}
