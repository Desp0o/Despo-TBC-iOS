// ამ კოდის გამოყენებით არ იღვევა open/closes
// პროტოკოლი Creature გვაძლევს საშუალებას ყველა ის კლასი რომელიც მას დააკონფორმირებს ჰქონდეს aboutMe მეთოდი
// პროტოკოლის გამოყენებით CreatureInfo კლასი დაბეჭდავს ყველა იმ ქმნილების ინფორმაციას რომელიც აკმაყოფილებს პროტოკოლს
// ახალი ქმნილების დამატებისას აღარ იქნება საჭირო CreatureInfo კლასის ცვლილება.

protocol Creature {
    func aboutMe()
}

class Minotaur: Creature {
    private let name: String
    
    init(name: String = "Minotaur") {
        self.name = name
    }
    
    func aboutMe() {
        print("was originally named Asterion")
    }
}

class Hydra: Creature {
    private let name: String
    
    init(name: String = "Hydra") {
        self.name = name
    }
    
    func aboutMe() {
        print("Among its nine heads, only one was truly immortal")
    }
}

class Hercules: Creature {
    
    private let name: String
    
    init(name: String = "Hydra") {
        self.name = name
    }
    
    
    func aboutMe() {
        print("Hercules' mortal life ended after being poisoned")
    }
}

class CreatureInfo {
    func printInfo(creature: Creature) {
        creature.aboutMe()
    }
}

CreatureInfo().printInfo(creature: Minotaur()) //was originally named Asterion
CreatureInfo().printInfo(creature: Hydra()) //Among its nine heads, only one was truly immortal
CreatureInfo().printInfo(creature: Hercules()) //Hercules' mortal life ended after being poisoned
