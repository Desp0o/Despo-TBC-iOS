//
//  DIWrong.swift.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

// ამ კოდში დარღევული DI ფუნქცია რადგან Frodo კლასი პირდაპირ დამოკიდებულია Sting კლასზე
// ანუ მაღალი დონის მოდული დამოკიდებულია დაბალი დონის მოდულზე
// ნაცვლად იმისა რომ დამოკიდებული იყოს აბსტრაქციაზე

final class Sting {
    func useWeapon() {
        print("Use sting to detect orcs")
    }
}

final class Frodo {
    private let sting: Sting
    
    init(sting: Sting) {
        self.sting = sting
    }
    
    func detectEnemy() {
        sting.useWeapon()
    }
}

