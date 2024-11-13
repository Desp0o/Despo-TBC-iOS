//
//  ISPWrong.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

// ამ მოყავნილ მაგალითში ირღვევა ISP პრინციპი
// პროტოკოლი მოიცავს რამდენიმე უნარს რომელიც ყველა პერსონაჟს არ შეესაბამება
// მაგრამ ყველა პერსონაჟს უწევს მაინც დააიმპლიმეტიროს მოცემული მეთოდები რომლებიც არ ჭირდებათ

protocol MiddleEarthCharacter {
    func useBow()
    func useAxe()
    func beStealthy()
}

final class Legolas: MiddleEarthCharacter {
    func useBow() {
        print("Legolas is best archer")
    }
    
    func useAxe() {
        print("legolas can use axe")
    }
    
    func beStealthy() {
        print("legolas can be stealthy")
    }
}


final class Gimli: MiddleEarthCharacter {
    func useBow() {
        print("Gumli can't use bow")
    }
    
    func useAxe() {
        print("Gimli's fav weapon is axe")
    }
    
    func beStealthy() {
        print("Gimli can't be stealthy")
    }
}
