//
//  OpenClosedWrong.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

// კოდი არღვევს open/closed პრიციპს რადგან CreatureInfo კლასი პრიდაპირ არის დამოკიდებული
// სხვა ქმნილებების კლასებზე და ახალი ქმნილების დამატებისას გვიწევს CreatureInfo კლასში ცვლილებების შეტანა

class Minotaur {
    private let name: String
    private let antlers: Int
    
    init(name: String = "Minotaur", antlers: Int = 2) {
        self.name = name
        self.antlers = antlers
    }
    
    func printInfo() {
        print(antlers)
        print(name)
        print("was originally named Asterion")
    }
}

class Hydra {
    private let name: String
    private let age: Int
    private let heads: Int
    
    init(name: String = "Hydra", age: Int = 32, heads: Int = 9) {
        self.name = name
        self.age = age
        self.heads = heads
    }
    
    func printInfo() {
        print(name)
        print(heads)
        print("Among its nine heads, only one was truly immortal")
    }
}

class CreatureInfo {
    let hydra = Hydra()
    let minotaur = Minotaur()
    
    func printCreaturesInfo() {
        hydra.printInfo()
        minotaur.printInfo()
    }
}

