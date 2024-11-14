
// ამ კოდში დარღევული DI ფუნქცია რადგან Frodo კლასი პირდაპირ დამოკიდებულია Sting კლასზე
// ანუ მაღალი დონის მოდული დამოკიდებულია დაბალი დონის მოდულზე
// ნაცვლად იმისა რომ დამოკიდებული იყოს აბსტრაქციაზე

final class Sting {
    func useWeapon() {
        print("Use sting to detect orcs")
    }
}

final class Frodo {
    private let weapon: Sting
    
    init(weapon: Sting) {
        self.weapon = weapon
    }
    
    func detectEnemy() {
        weapon.useWeapon()
    }
}

Frodo(weapon: Sting()).detectEnemy()
