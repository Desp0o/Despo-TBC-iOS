//
//  SRPCorrect.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

import Foundation

// ამ კოდის მიხედვით კლასი აკმაყოფილებს SRP პრინციპს
// ყველა არსებას აქვს თავის კლასი სადაც ხდება მათზე ოპერაციები და სრულდება ლოგიკები
// თუ რომელიმე არსების ლოგიკები იქნება შესაცვლელი შეიცხლება მხოლოდ შესაბამისი კლასი
// SRPCorrect კლასი მართავს მხოლოდ მთავარ handleJungle ფუნქციას

final class Animals {
    func getAnimals() -> Data {
        return Data()
    }
}

final class Birds {
    func getBirds() -> Data {
        return Data()
    }
}

final class Reptiles {
    func getReptiles() -> Data {
        return Data()
    }
}

final class SRPCorrect {
    let animals: Animals?
    let birds: Birds?
    let reptile: Reptiles?
    
    init(animals: Animals?, birds: Birds?, reptile: Reptiles?) {
        self.animals = animals
        self.birds = birds
        self.reptile = reptile
    }
    
    func handleJungle() {
        let allAnimals = animals?.getAnimals()
        let allBirds = birds?.getBirds()
        let allReptile = reptile?.getReptiles()
    }
}
