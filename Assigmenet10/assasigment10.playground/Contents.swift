import Foundation

//MARK: 1. შექმენით CreatureType enum-ი სხვადასხვა ტიპის არსებებით (მაგ: fire, water, earth, air, electric …). გამოიყენეთ associated value, რომ თითოეულ ტიპს ჰქონდეს rarity: Double მნიშვნელობა 0-დან 1-მდე. დაამატეთ computed property description, რომელიც დააბრუნებს არსების ტიპის აღწერას. 

let randomDouble = ((Double.random(in: 0.1...1) * 10).rounded() / 10)

enum CreatureType: CaseIterable {
    case fire(rarity: Double = randomDouble)
    case water(rarity: Double = randomDouble)
    case earth(rarity: Double = randomDouble)
    case air(rarity: Double = randomDouble)
    case electric(rarity: Double = randomDouble)
    
    static let allCases: [CreatureType] = [
        .fire(rarity: randomDouble),
        .water(rarity: randomDouble),
        .earth(rarity: randomDouble),
        .air(rarity: randomDouble),
        .electric(rarity: randomDouble)
    ]
    
    var description: String {
        switch self {
        case .fire(let rarity), .water(let rarity), .earth(let rarity), .air(let rarity), .electric(let rarity):
            return "Creature \(self)"
        }
    }
}


//MARK: 2. შექმენით პროტოკოლი CreatureStats შემდეგი მოთხოვნებით:
//    * var health: Double
//    * var attack: Double
//    * var defense: Double
//    * func updateStats(health: Double, attack: Double, defense: Double) მეთოდი, რომელიც განაახლებს ამ მონაცემებს (შეგიძლიათ ფუნქციის პარამეტრები სურვილისამებრ შეცვალოთ, მაგ: დეფოლტ მნიშვნელობები გაუწეროთ 😌) 

protocol CreatureStats {
    var health: Double { get set }
    var attack: Double { get set }
    var defense: Double { get set }
    
    func updateStats(health: Double, attack: Double, defense: Double)
}

extension CreatureStats {
    func updateStats(health: Double? = 100, attack: Double, defense: Double) {}
}

//MARK: 3. შექმენით კლასი Trainer შემდეგი ფროფერთებით:
//    * public let name: String
//    * private var creatures: [DigitalCreature]
//    * დაამატეთ public მეთოდი add(creature: DigitalCreature) რომლითაც შეძლებთ ახალი არსების დამატებას მასივში, ასევე არსებას საკუთარ თავს (self) დაუსეტავს ტრენერად.

class Trainer {
    public let name: String
    private var creatures: [DigitalCreature]
    
    init(name: String, creatures: [DigitalCreature] = []) {
        self.name = name
        self.creatures = creatures
    }
    
    public func add(creature: DigitalCreature){
        creatures.append(creature)
        creature.trainer = self
    }
}

//MARK: 4. შექმენით კლასი DigitalCreature, რომელიც დააკმაყოფილებს CreatureStats პროტოკოლს. დაამატეთ:
//    * public let name: String
//    * public let type: CreatureType
//    * public var level: Int
//    * public var experience: Double
//    * weak public var trainer: Trainer?
//    * დაამატეთ deinit მეთოდი, რომელიც დაბეჭდავს შეტყობინებას არსების წაშლისას. 

class DigitalCreature: CreatureStats {
    public let name: String
    public let type: CreatureType
    public var level: Int
    public var experience: Double
    weak public var trainer: Trainer?
    var health: Double
    var attack: Double
    var defense: Double
    
    init(name: String, type: CreatureType, level: Int, experience: Double, trainer: Trainer? = nil, health: Double, attack: Double, defense: Double) {
        self.name = name
        self.type = type
        self.level = level
        self.experience = experience
        self.trainer = trainer
        self.health = health
        self.attack = attack
        self.defense = defense
    }
    
    func updateStats(health: Double, attack: Double, defense: Double) {
        self.health = health
        self.attack = attack
        self.defense = defense
    }
    
    deinit {
        print("R.I.P \(name)")
    }
    
}

//MARK: 5. შექმენით CreatureManager კლასი შემდეგი ფუნქციონალით:
//    * private var creatures: [DigitalCreature] - არსებების მასივი
//    * public func adoptCreature(_ creature: DigitalCreature) - არსების დამატება
//    * public func trainCreature(named name: String) - კონკრეტული არსების წვრთნა (გაითვალისწინეთ რომ წვრთნა მოხდება მხოლოდ მაშინ თუ არჩეულ არსებას ყავს მწვრთნელი!)
//    * public func listCreatures() -> [DigitalCreature] - ყველა არსების სიის დაბრუნება
//    გააფართოვეთ CreatureManage კლასი მეთოდით func trainAllCreatures(), რომელიც გაწვრთნის ყველა არსებას. 

class CreatureManager {
    private var creatures: [DigitalCreature]
    
    init(creatures: [DigitalCreature] = []) {
        self.creatures = creatures
    }
    
    public func adoptCreature(_ creature: DigitalCreature) {
        creatures.append(creature)
    }
#warning("ხვალ მოვბრუნდე")
    public func trainCreature(named name: String) {
        if creatures.isEmpty {
            print("there is no creatures")
        } else if creatures.contains (where: { name == $0.name && $0.trainer != nil })
        {
            print("okey i will train dragon")
        } else {
            print("firs take trainer")
        }
    }
    
    public func listCreatures() -> [DigitalCreature] {
        return creatures
    }
}

extension CreatureManager {
    func trainAllCreatures() {
        creatures.forEach { self.trainCreature(named: $0.name)
        }
    }
}

//6. შექმენით CreatureShop კლასი მეთოდით purchaseRandomCreature() -> DigitalCreature. ეს მეთოდი დააბრუნებს რანდომიზირებულად დაგენერირებულ არსებას. 
class CreatureShop {
#warning("დაწყებული")
    func purchaseRandomCreature() -> DigitalCreature {
        return DigitalCreature(
            name: "1",
            type: CreatureType.allCases.randomElement()!,
            level: 0,
            experience: 0,
            health: 100,
            attack: Double(Int.random(in: 0...100)),
            defense: Double(Int.random(in: 0...100))
        )
    }
}


var beast = DigitalCreature(name: "beast", type: .air(), level: 1, experience: 1, health: 1, attack: 1, defense: 1)
var trainer = Trainer(name: "trainer")
trainer.add(creature: beast)
var manager = CreatureManager()
manager.adoptCreature(beast)
manager.trainAllCreatures()
print(manager.trainCreature(named: "beast"))
print(manager.listCreatures())


print("y")
print("y")
print("y")

