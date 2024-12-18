//
//  Trash.swift
//  33. Gestures
//
//  Created by Despo on 18.12.24.
//

import SwiftUI

struct Trash: View {
    let vm = TrashViewModel()
    @State var xPosOne = CGFloat(UIScreen.main.bounds.width / 2)
    @State var yPosOne = CGFloat(UIScreen.main.bounds.height / 2 - 165)
    @State private var isHidden = false
    
    @State var xPosTwo = CGFloat(UIScreen.main.bounds.width - 60)
    @State var yPosTwo = CGFloat(UIScreen.main.bounds.height - 200)
    
    let fileSize = CGSize(width: 200, height: 200)
    let binSize = CGSize(width: 50, height: 50)
    
    var body: some View {
        ZStack {
            if !isHidden {
                Image("fileIcon")
                    .resizable()
                    .frame(width: fileSize.width, height: fileSize.height)
                    .position(x: xPosOne, y: yPosOne)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.easeOut(duration: 0.2)) {
                                    xPosOne = value.location.x
                                    yPosOne = value.location.y
                                }
                                
                                if vm.checkCollision(
                                    point1: CGPoint(x: xPosOne, y: yPosOne),
                                    size1: fileSize,
                                    point2: CGPoint(x: xPosTwo, y: yPosTwo),
                                    size2: binSize
                                ) {
                                    isHidden = true
                                }
                            }
                    )
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("bin")
                        .resizable()
                        .frame(width: binSize.width, height: binSize.height)
                }
                .padding()
            }
        }
        .background(.customGreen)
    }
}

#Preview {
    Trash()
}
