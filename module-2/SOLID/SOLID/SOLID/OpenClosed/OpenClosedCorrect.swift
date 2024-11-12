//
//  OpenClosedCorrect.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

// ამ კოდის გამოყენებით არ იღვევა open/closes
// პროტოკოლი Creature გვაძლევს საშუალებას ყველა ის კლასი რომელიც მას დააკონფორმირებს ჰქონდეს printInfo მეთოდი
// პროტოკოლის გამოყენებით CreatureInfo1 კლასი დაბეჭდავს ყველა იმ ქმნილების ინფორმაციას რომელიც აკმაყოფილებს პროტოკოლს
// ახალი ქმნილების დამატებისას აღარ იქნება საჭირო CreatureInfo1 კლასის ცვლილება.

protocol Creature {
    func printInfo()
}

class Minotaur1: Creature {
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

class Hydra1: Creature {
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

class CreatureInfo1 {
    private let mythicCreatures: [Creature]
    
    init(mythicCreatures: [Creature]) {
        self.mythicCreatures = mythicCreatures
    }
    
    func printCreaturesInfo() {
        mythicCreatures.forEach { $0.printInfo() }
    }
}

