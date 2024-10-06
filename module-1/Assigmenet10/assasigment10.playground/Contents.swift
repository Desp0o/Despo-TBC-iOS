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
        case .fire, .water, .earth, .air, .electric:
            return "Creature \(self)"
        }
    }
}


//MARK: 2. შექმენით პროტოკოლი CreatureStats შემდეგი მოთხოვნებით:
/* * var health: Double
   * var attack: Double
   * var defense: Double
   * func updateStats(health: Double, attack: Double, defense: Double) მეთოდი, რომელიც განაახლებს ამ მონაცემებს (შეგიძლიათ ფუნქციის პარამეტრები სურვილისამებრ შეცვალოთ, მაგ: დეფოლტ მნიშვნელობები გაუწეროთ 😌) */

protocol CreatureStats {
    var health: Double { get set }
    var attack: Double { get set }
    var defense: Double { get set }
    
    func updateStats(health: Double, attack: Double, defense: Double)
}

extension CreatureStats {
    mutating func updateStats(health: Double = 100, attack: Double, defense: Double) {
        self.health = health
        self.attack = attack
        self.defense = defense
    }
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
        if creature.trainer == nil {
            creatures.append(creature)
            creature.trainer = self
        } else if creatures.contains(where: { $0.name == creature.name }) {
            print("შენ უკვე წვრთნი \(creature.name) - ს")
        } else {
            print("\(creature.name) - ს უკვე წვრთნიან")
        }
    }
}

// დავამატე არსების წასაშლელად 8 დავალებიდან გამომდინარე
extension Trainer {
    func removeCreature(creature: DigitalCreature) {
        if let index = creatures.firstIndex(where: { $0.name == creature.name }) {
            creatures.remove(at: index)
            creature.trainer = nil
        } else {
            print("\(creature.name) არ არის შენ სამწვრთნელო გუნდში")
        }
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
    
    public func trainCreature(named name: String) {
        if let index = creatures.firstIndex(where: { $0.name == name }) {
            var creature = creatures[index]
            
            if creature.trainer != nil {
                // ვარჯიშის დროს ემატება შეტევა და დაცვა პროცენტულად
                let trainedAttack = (((creature.attack * 5 / 100) + creature.attack) * 10 ).rounded() / 10
                let trainedDefence = (((creature.defense * 7 / 100) + creature.defense) * 10 ).rounded() / 10
                
                //გამოცდილების მატებისას თუ exp >= 100 გადადის ლეველზე და ზედმეტი exp არ იწვება
                creature.experience += 20
                
                if creature.experience >= 100 {
                    creature.experience = creature.experience - 100
                    creature.level += 1
                }
                
                creature.updateStats(attack: trainedAttack, defense: trainedDefence)
            } else {
                print("\(name) - ს ჭირდება ტრენერი სავარჯიშოდ")
            }
        } else {
            print("მსგავსი ქმნილება სახელით - \(name) არ იძებნება გუნდში")
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

// ჯამური ძალის გამოსათვლელად
extension CreatureManager {
    func playersTotalPower() -> Double {
        //აქ ლეველს ვამრავლებ 100-ზე, ლეველზე გადასვლას რო ქონდეს მუღამი :D
        let totalPower = creatures.reduce(0) { result, creature in
            
            //თუ არსებას არ ყავს ტრენერი არ მიეთვალოს საერთო ძალაში
            let power = creature.trainer != nil ? creature.attack + creature.experience + creature.defense + Double(creature.level * 100) + result : 0
            
            let finalPower = result + power
            return finalPower
        }
        
        return totalPower
    }
}


//MARK: 6. შექმენით CreatureShop კლასი მეთოდით purchaseRandomCreature() -> DigitalCreature. ეს მეთოდი დააბრუნებს რანდომიზირებულად დაგენერირებულ არსებას. 

class CreatureShop {
    private var creatureNames = [ "Dragon", "Phoenix", "Griffin", "Kraken", "Basilisk", "Minotaur", "Unicorn", "Chimera", "Hydra", "Sphinx", "Pegasus", "Cerberus", "Mermaid", "Nymph", "Faun", "Gorgon", "Werewolf", "Vampire", "Cyclops", "Yeti", "Kelpie", "Lamia", "Leviathan", "Wyvern", "Banshee", "Ogre", "Troll", "Wendigo", "Fenrir", "Chupacabra", "Harpy", "Selkie", "Ghoul", "Manticore", "Imp", "Jotunn", "Ifrit", "Rakshasa", "Sasquatch", "Kitsune", "Djinn", "Peryton", "Qilin", "Amphiptere", "Ziz", "Centaurs", "Garuda", "Simurgh", "Naga", "Mothman" ]
    
    func purchaseRandomCreature() -> DigitalCreature {
        let choosenNameIndex = Int.random(in: 0...creatureNames.count - 1)
        
        let generatedCreature = DigitalCreature(
            name: creatureNames[choosenNameIndex],
            type: CreatureType.allCases.randomElement()!,
            level: 0,
            experience: Double(Int.random(in: 0...100)),
            health: 100,
            attack: Double(Int.random(in: 50...100)),
            defense: Double(Int.random(in: 50...100))
        )
        
        creatureNames.remove(at: choosenNameIndex)
        
        return generatedCreature
    }
}


//MARK: 7. შექმენით გლობალური ფუნქცია updateLeaderboard(players: [PlayerProfile]) -> [PlayerProfile], რომელიც დაალაგებს მოთამაშეებს მათი არსებების ჯამური ძალის მიხედვით.  

func updateLeaderboard(players: [CreatureManager]) -> [CreatureManager] {
    var stats: [CreatureManager] = players
    
    stats.sort { $0.playersTotalPower() > $1.playersTotalPower() }
    
    return stats
}


//MARK: 8. გამოვიყენოთ წინა ტასკებში შექმნილი ყველა ფუნქციონალი:
//    * შექმენით რამდენიმე Trainer ობიექტი
//    * შექმენით რამდენიმე CreatureManager ობიექტი
//    * შექმენით ერთი ან ორი CreatureShop
//    * თითოეული მენეჯერისთვის:
//        * შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
//        * მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
//        * სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
//    * გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)
//    * განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
//    * დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
//    * წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
//    * დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას 

let trainer1 = Trainer(name: "Trainer 1")
let trainer2 = Trainer(name: "Trainer 2")

let manager1 = CreatureManager()
let manager2 = CreatureManager()

let shop = CreatureShop()

let creature1 = shop.purchaseRandomCreature()
let creature2 = shop.purchaseRandomCreature()
let creature3 = shop.purchaseRandomCreature()
let creature4 = shop.purchaseRandomCreature()
var creature5 = shop.purchaseRandomCreature()
var creature6: DigitalCreature? = shop.purchaseRandomCreature()


//მივაბაროთ ტრენერებს
trainer1.add(creature: creature1)
trainer1.add(creature: creature2)

trainer2.add(creature: creature3)
trainer2.add(creature: creature4)
trainer2.add(creature: creature6!)


//მივაბაროთ მენჯრებს
manager1.adoptCreature(creature1)
manager1.adoptCreature(creature2)

manager2.adoptCreature(creature3)
manager2.adoptCreature(creature4)


//ვნახოთ საწყისი სტატისტიკა წვრთმანდე
let startStat = updateLeaderboard(players: [manager1, manager2])

print("საწყისი სტატისტიკა 📝")

for npc in startStat {
    print("\(npc.self) ქულით: \(npc.playersTotalPower())")
}

print("\n")


//გავრწვთნათ
manager1.trainCreature(named: creature1.name)
manager1.trainCreature(named: creature2.name)
manager1.trainCreature(named: creature4.name) // არ ყავს გუნდში
manager1.trainAllCreatures()

manager2.trainAllCreatures()


//სტატისტიკა წვრთნის შედეგად
let currentStat = updateLeaderboard(players: [manager1, manager2])

print("\nსაბოლოო სტატისტიკა 📝")

for npc in currentStat {
    print("\(npc) ქულით: \(npc.playersTotalPower())")
}


//დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
var playerArray = [manager1, manager2]

print("\n\nმოთამაშის არსებების სია და სტატისტიკა 🐙")

playerArray.forEach {
    print("\n\($0.self)")
    $0.listCreatures().forEach {
        print("სახელი: \($0.name), შეტევა: \($0.attack), დაცვა: \($0.defense), სიცოცხლე: \($0.health), exp: \($0.experience), ლეველი: \($0.level), ტიპი: \($0.type), ტრენერი: \($0.trainer?.name ?? "არ ყავს ტრენერი")")
    }
}


//წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
print("\n🦑 არსების წაშლა ტრენერისგან")

print("წაშლამდე: \(creature6?.trainer?.name ?? "არ ყოლია")")
trainer2.removeCreature(creature: creature6!)
print("წაშლის შემდეგ: \(creature6?.trainer?.name ?? "აღარ ყავს ტრენერი")")


//დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას 
print("\n🦞 არსების დეინიციალიზაცია")
creature6 = nil


//MARK: 9. შექმენით BattleSimulator კლასი, რომელიც მართავს ორ DigitalCreature-ს შორის ბრძოლას.
/*   * გამოიყენეთ weak/unowned მიმთითებლები სათანადოდ, რათა თავიდან აიცილოთ ე.წ memory leak.
//    * დაამატეთ მეთოდი simulateBattle(between creature1: DigitalCreature, and creature2: DigitalCreature) -> DigitalCreature, რომელიც დააბრუნებს გამარჯვებულს. მეთოდის ლოგიკას როგორს გააკეთებთ თქვენს ფანტაზიაზეა დამოკიდებული 🙌
* გამართეთ რამდენიმე ბრძოლა და დაბეჭდეთ შედეგები. 🤺 */

class BattleSimulator {
    var creature1: DigitalCreature
    var creature2: DigitalCreature
    
    init(creature1: DigitalCreature, creature2: DigitalCreature) {
        self.creature1 = creature1
        self.creature2 = creature2
    }
    
    func simulateBattle(between creature1: DigitalCreature, and creature2: DigitalCreature) -> DigitalCreature {
        var firstCreatureHealth = creature1.health
        var secondCreatureHealth = creature2.health
        
        let hitPointForFirst = (creature1.attack / 10).rounded()
        let hitPointForSecond = (creature2.attack / 10).rounded()
        
        var scoreForFirst = 0
        var scoreForSecond = 0
        
        var roundCount = 0
        
        print("\n\n\(creature1.name) ⚔️ \(creature2.name)")
                
        //სამამდეა თამაში :D
        while scoreForFirst < 3 && scoreForSecond < 3 {
            roundCount += 1
            
            //ვამოწმებთ პირველი ვისი სიცოცხლე ჩამოვა ნულზე და ვწყვეტთ
            while firstCreatureHealth >= 0 && secondCreatureHealth >= 0 {
                let random = Int.random(in: 1...2)
                
                if random == 1 {
                    secondCreatureHealth -= hitPointForFirst
                } else {
                    firstCreatureHealth -= hitPointForSecond
                }
                
                if firstCreatureHealth <= 0 {
                    scoreForSecond += 1
                    break
                }
                
                if secondCreatureHealth <= 0 {
                    scoreForFirst += 1
                    break
                }
            }
            
            firstCreatureHealth = creature1.health
            secondCreatureHealth = creature2.health

            print("Round \(roundCount == 1 ? "1️⃣" : roundCount == 2 ? "2️⃣" : roundCount == 3 ? "3️⃣" : roundCount == 4 ? "4️⃣" : "5️⃣" )  \n\(scoreForFirst) : \(scoreForSecond)")
        }
        
        print("Winner Winner Chicken Dinner 🏆 \(scoreForFirst > scoreForSecond ? creature1.name : creature2.name) 🏆 \n")

        return scoreForFirst > scoreForSecond ? creature1 : creature2
    }
    
    deinit {
        print("\nBattle over... see u next time 🥊")
    }
}

var fighter1: DigitalCreature? = shop.purchaseRandomCreature()
var fighter2: DigitalCreature? = shop.purchaseRandomCreature()
var fighter3: DigitalCreature? = shop.purchaseRandomCreature()
var fighter4: DigitalCreature? = shop.purchaseRandomCreature()

var fightClub: BattleSimulator? = BattleSimulator(creature1: creature1, creature2: creature2)

fightClub?.simulateBattle(between: creature1, and: creature2)

//დეინიციალიზაცია ჩატარებული ბრძოლის მონაწილეების
fighter1 = nil
fighter2 = nil

fightClub?.simulateBattle(between: creature3, and: creature4)

//დეინიციალიზაცია ჩატარებული ბრძოლის მონაწილეების
fighter3 = nil
fighter4 = nil

//Fight night დახურვა
fightClub = nil
















print("")
