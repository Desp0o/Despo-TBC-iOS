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

final class Legolas: ElfCcharacter {
    func useBow() {
        print("Legolas is best archer")
    }
    
    func beStealthy() {
        print("legolas can be stealthy")
    }
}

final class Gimli: GnomeCharacter {
    func useAxe() {
        print("Gimli's fav weapon is axe")
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
//final class Legolas: Archer, Stealthy {
//    func useBow() {
//        print("Legolas is best archer")
//    }
//
//    func beStealthy() {
//        print("legolas can be stealthy")
//    }
//}
//
//final class Gimli: Berserker {
//    func useAxe() {
//        print("Gimli's fav weapon is axe")
//    }
//}
