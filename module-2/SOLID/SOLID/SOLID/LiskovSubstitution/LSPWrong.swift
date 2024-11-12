//
//  LSPWrong.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

// ამ კოდიში კლასი Animal ინახავს კვების რაციონს ყველა შემთხვევაში
// LSP მიხედით შვილობილ კლასს არ უნდა ქონდეს ისეთი ლოგიკა რომელიც არღვევს მემკვიდროებით მიღებულ მეთოდებს
// და უნდა ასრულებდეს სრულყოფილად ყველაფერს რასაც ასრუელბს მშობელი კლასი

class Animal {
    func save(data: String) {
        print("food ration: \(data)")
    }
}

final class Predator: Animal {
    override func save(data: String) {
        if data.contains("meat") {
            super.save(data: "food ration: \(data)")
        } else {
            print("predators doesnt eat such a cute food")
        }
    }
}


