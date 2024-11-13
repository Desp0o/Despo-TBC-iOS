//
//  ISPCorrect.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

// ამ კოდში დაცულია ISP პრინციპ რადნაგნ პროტოკოლები შეცავენ ისეთ მეთოდებს
// რომელბიც ჭირდებათ სხვა და სხვა პერსონაჟებს, და მათ არ უწევთ ისეთი მეთოდების მაინც გამოყენება რომელბიც არ ჭირდებათ
// აქ შეგვეძლო დაგვეყო ასევე პროტოკელები უნარების მიხედვით უფრო მაშტაბურად გამოსაყენებლად ქვემოთ კომენატრად დავტოვებ


protocol ElfCcharacter {
    func useBow()
    func beStealthy()
}

protocol GnomeCharacter {
    func useAxe()
}

final class Galadriel: ElfCcharacter {
    func useBow() {
        print("Galadriel elfs can use bow")
    }
    
    func beStealthy() {
        print("Galadriel can be stealthy")
    }
}

final class Thorin: GnomeCharacter {
    func useAxe() {
        print("Thorin's fav weapon is axe")
    }
}

//protocol Archer {
//    func useBow()
//}
//
//protocol Stealthy {
//    func beStealthy()
//}
//
//protocol Berserker {
//    func useAxe()
//}
//
//
//final class Galadriel: Archer, Stealthy {
//    func useBow() {
//        print("Galadriel elfs can use bow")
//    }
//    
//    func beStealthy() {
//        print("Galadriel can be stealthy")
//    }
//}
//
//final class Thorin: Berserker {
//    func useAxe() {
//        print("Thorin's fav weapon is axe")
//    }
//}
