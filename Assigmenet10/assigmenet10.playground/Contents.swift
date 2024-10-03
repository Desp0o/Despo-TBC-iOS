import Foundation

//MARK: 1. შექმენით CreatureType enum-ი სხვადასხვა ტიპის არსებებით (მაგ: fire, water, earth, air, electric …). გამოიყენეთ associated value, რომ თითოეულ ტიპს ჰქონდეს rarity: Double მნიშვნელობა 0-დან 1-მდე. დაამატეთ computed property description, რომელიც დააბრუნებს არსების ტიპის აღწერას. 

let randomDouble = (Double.random(in: 0.1...1) * 10).rounded() / 10

enum CreatureType {
    case fire(rarity: Double = randomDouble)
    case water(rarity: Double = randomDouble)
    case earth(rarity: Double = randomDouble)
    case air(rarity: Double = randomDouble)
    case electric(rarity: Double = randomDouble)
    
    var description: String {
        switch self {
        case .fire(let rarity), .water(let rarity), .earth(let rarity), .air(let rarity), .electric(let rarity):
            return "creature: \(self)"
        }
    }
}


