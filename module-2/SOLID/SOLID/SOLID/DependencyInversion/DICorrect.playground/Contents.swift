// კოდი იცავს DI პრინციპს რადგან პირდაპირი დამოკიდებულის ნაცლვად დამოკიდებულია აბსტრაქცია
// არც მაღალი დონის მოდულია დამოკიდებული დაბალი დონის მოდულზ
// Frodo კლასს შეუძლია გამოიყენოს ყველა ის იარაღი რომელიც აკმაყოფილებს პროტოკოლ WeaponProtocol-ს

final class Sting: WeaponProtocol {
    func useWeapon() {
        print("Use sting to detect orcs")
    }
}

final class Bow: WeaponProtocol {
    func useWeapon() {
        print("Use Longbow")
    }
}

final class Frodo {
    private let weapon: WeaponProtocol

    init(weapon: WeaponProtocol) {
        self.weapon = weapon
    }

    func detectEnemy() {
        weapon.useWeapon()
    }
}

Frodo(weapon: Sting()).detectEnemy()
Frodo(weapon: Bow()).detectEnemy()
