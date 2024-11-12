//
//  SRPWrong.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

import Foundation

//ეს კლასი არღვევს SOLID SRP პრინციპს, რადგან კლასი ახდენს სხვა და სხვა ტიპის არსებების მართვას
//და ყველა ლოგიკა მოქცეულია ერთ კლასში

final class SRPWrong {
    
    init() {}
    
    private func getAnimals() -> Data {
        return Data()
    }
    
    private func getBirds() -> Data {
        return Data()
    }
    
    private func getReptiles() -> Data {
        return Data()
    }
    
    func handleJungle() {
        let allAnimals = getAnimals()
        let allBirds = getBirds()
        let reptile = getReptiles()
    }
}
