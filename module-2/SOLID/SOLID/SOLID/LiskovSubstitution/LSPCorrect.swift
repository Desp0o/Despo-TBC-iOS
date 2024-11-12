//
//  LSPCorrect.swift
//  SOLID
//
//  Created by Despo on 13.11.24.
//

// კოდი იცავს LSP პრინციპს რადგან შვილობილი კაცი ასრულებს პირნათლად მემკვიდრეობით მიღებულ ვალდებულებას
// შვილობილ კლასში არ არის მიღებულ მეთოდებში დამატებითი ლოგიკა.
// შვილობილ კლასში ამ შემტხვევაშ override არ არის საჭირო რადგან დამატებით ლოგიკას ა რმოითხოვს მაგრამ არ ვიცი ვტოვებ მაინც

class Animal1 {
    func save(data: String) {
        if data.contains("meat") {
            print("predators food ration is \(data)")
        } else {
            print("food ration: \(data)")
        }
    }
}

final class Predator1: Animal {
    override func save(data: String) {
        super.save(data: data)
    }
}
