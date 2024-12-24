//
//  TrashViewModel.swift
//  33. Gestures
//
//  Created by Despo on 18.12.24.
//

import SwiftUI

final class TrashViewModel {
    func checkCollision(point1: CGPoint, size1: CGSize, point2: CGPoint, size2: CGSize) -> Bool {
        let shrink: CGFloat = 0.5
        
        let rect1 = CGRect(
            x: point1.x - (size1.width * shrink) / 2,
            y: point1.y - (size1.height * shrink) / 2,
            width: size1.width * shrink,
            height: size1.height * shrink
        )
        
        let rect2 = CGRect(
            x: point2.x - (size2.width * shrink) / 2,
            y: point2.y - (size2.height * shrink) / 2,
            width: size2.width * shrink,
            height: size2.height * shrink
        )
        
        return rect1.intersects(rect2)
    }
}
