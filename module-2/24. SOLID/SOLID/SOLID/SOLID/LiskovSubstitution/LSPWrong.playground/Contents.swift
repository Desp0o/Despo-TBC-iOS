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
            super.save(data: "predators food ration is: \(data)")
        } else {
            print("food ration is \(data)")
        }
    }
}
