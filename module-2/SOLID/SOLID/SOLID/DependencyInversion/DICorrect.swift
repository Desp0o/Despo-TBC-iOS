//
//  DICorrect.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

// კოდი იცავს DI პრინციპს რადგან პირდაპირი დამოკიდებულის ნაცლვად დამოკიდებულია აბსტრაქცია
// არც მაღალი დონის მოდულია დამოკიდებული დაბალი დონის მოდულზ

protocol WeaponProtocol {
    func useWeapon()
}

final class Sting1: WeaponProtocol {
    func useWeapon() {
        print("Use sting to detect orcs")
    }
}

final class Frodo1 {
    private let sting: WeaponProtocol

    init(sting: WeaponProtocol) {
        self.sting = sting
    }

    func detectEnemy() {
        sting.useWeapon()
    }
}
