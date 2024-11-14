// კოდი არღვევს open/closed პრიციპს რადგან CreatureInfo კლასი პრიდაპირ არის დამოკიდებული
// სხვა ქმნილებების კლასებზე და ახალი ქმნილების დამატებისას გვიწევს CreatureInfo კლასში ცვლილებების შეტანა


class Minotaur {
    private let name: String
    
    init(name: String = "Minotaur") {
        self.name = name
    }
}

class Hydra {
    private let name: String

    init(name: String = "Hydra") {
        self.name = name
    }
}

class CreatureInfo {
    func printInfo(creature: Any) {
        if let minotaur = creature as? Minotaur {
            print("was originally named Asterion")
        } else if let hydra = creature as? Hydra {
            print("Among its nine heads, only one was truly immortal")
        }
    }
}

CreatureInfo().printInfo(creature: Minotaur()) //was originally named Asterion
CreatureInfo().printInfo(creature: Hydra()) //Among its nine heads, only one was truly immortal
