//
//  WheelViewModel.swift
//  33. Gestures
//
//  Created by Despo on 18.12.24.
//

import SwiftUI

final class WheelViewModel {
    
    let colors: [Color] = [
        Color.red,
        Color.green,
        Color.blue,
        Color.yellow,
        Color.orange,
        Color.purple,
        Color.pink,
        Color.cyan,
        Color.gray,
        Color.mint
    ]
    
    var colorCount: Int {
        colors.count
    }

    func createStartAngle(with index: Int) -> Double {
        Double(index) / Double(colors.count) * 360
    }
    
    func createEndAngle(with index: Int) -> Double {
        Double(index + 1) / Double(colors.count) * 360
    }
    
    func makeWheelSpin() -> Double {
        360 * 5 + Double.random(in: 0..<360)
    }
}
