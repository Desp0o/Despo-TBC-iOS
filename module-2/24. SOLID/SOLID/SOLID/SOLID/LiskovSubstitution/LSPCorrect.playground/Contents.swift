// კოდი იცავს LSP პრინციპს რადგან შვილობილი კაცი ასრულებს პირნათლად მემკვიდრეობით მიღებულ ვალდებულებას
// შვილობილ კლასში არ არის მიღებულ მეთოდებში დამატებითი ლოგიკა.
// შვილობილ კლასში ამ შემტხვევაშ override არ არის საჭირო რადგან დამატებით ლოგიკას ა რმოითხოვს

class Animal {
    func save(data: String) {
        if data.contains("meat") {
            print("predators food ration is \(data)")
        } else {
            print("food ration: \(data)")
        }
    }
}

final class Predator: Animal { }

Predator().save(data: "meat") // predators food ration is meat
Predator().save(data: "grass") // food ration: grass
