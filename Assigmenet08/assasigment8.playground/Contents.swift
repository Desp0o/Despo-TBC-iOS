import Foundation

// MARK: 1. შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება შემდეგი თვისებები:
// title - ფილმის სახელი,
// releaseYear— გამოშვების წელი,
// genre — ფილმის ჟანრი,
// revenue - შემოსავალი
// მეთოდი description(), რომელიც დაბეჭდავს ინფორმაციას ფილმზე.

enum Genre {
    case action
    case drama
    case comedy
    case thriller
    case fantasy
    case adventure
    case sciFi
}

class Film {
    var title: String
    var releaseYear: Int
    var genre: Genre
    var revenue: Double
    
    init(title: String, releaseYear: Int, genre: Genre, revenue: Double) {
        self.title = title
        self.releaseYear = releaseYear
        self.genre = genre
        self.revenue = revenue
    }
    
    func description() {
        print("info: \n title: \(title) \n release year: \(releaseYear) \n genre: \(genre) \n revenue: \(revenue)")
    }
    
    func removeFilm(films: inout [Film], title: String) {
        films.removeAll { $0.title == title }
    }
}

var myFilmsArr = [
    Film(title: "iOS World", releaseYear: 2024, genre: .thriller, revenue: 0),
    Film(title: "swift Hell", releaseYear: 2024, genre: .thriller, revenue: 10)
]

let myFilm = Film(title: "My Film", releaseYear: 1993, genre: .adventure, revenue: 1000000)
myFilm.description()
myFilm.removeFilm(films: &myFilmsArr, title: "iOS World")

print("\n")


// MARK: 2. შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
//name — პიროვნების სახელი
//birthYear — დაბადების წელი.
//მეთოდი getAge რომელიც დაიანგარიშებს და დააბრუნებს ამ პიროვნების ასაკს მოცემულ წელს.

class Person {
    var name: String
    var birthYear: Int
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func getAge() -> Int {
        let currentYear = Calendar.current.component(.year, from: Date())
        
        return currentYear - birthYear
    }
}


// MARK: 3. Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.

// - პირველი ამოცანში ჩავწერე ეს ფუნქცია

// MARK: 4. შექმენით კლასი Actor, რომელიც არიას Person კლასის მემკვიდრე კლასი
//Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ ნათამაშებ ფილმებს დაამატებს სიაში.

final class Actor: Person {
    var actedFilms: [Film] = []
    
    func addActedFilm(filmTitle: Film) {
        actedFilms.append(filmTitle)
    }
}


// MARK: 5. შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი.
//დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.

final class Director: Person {
    var directedFilms: [Film]
    var totalRevenue: Double = 0
    
    init(directedFilms: [Film], name: String, birthYear: Int) {
        self.directedFilms = directedFilms
        super.init(name: name, birthYear: birthYear)
    }
    
    func updateCareer(movieList: [Film]) {
        movieList.map { (movie) in
            directedFilms.append(movie)
            totalRevenue += movie.revenue
        }
    }
}

let onTheRoad = Film(title: "On The Road", releaseYear: 2012, genre: .drama, revenue: 9617000)
let godFather = Film(title: "The Godfather", releaseYear: 1972, genre: .drama, revenue: 250342198)

let coppola = Director(directedFilms: [onTheRoad], name: "Francis Ford Coppola", birthYear: 1939)
coppola.updateCareer(movieList: [godFather])


// MARK: 6. შექმენით 5 ფილმის და 5 მსახიობის ობიექტები და Dictionary, რომელშიც key იქნება მსახიობის სახელი, ხოლო მნიშვნელობებად მიიღებს იმ ფილმების სიას, რომლებშიც მონაწილეობს ეს მსახიობი.

var movieArray = [
    Film(title: "The Godfather", releaseYear: 1972, genre: .drama, revenue: 250342198),
    Film(title: "The Dark Knight", releaseYear: 2008, genre: .thriller, revenue: 1008971236),
    Film(title: "Pulp Fiction", releaseYear: 1994, genre: .action, revenue: 213928762),
    Film(title: "Forrest Gump", releaseYear: 1994, genre: .drama, revenue: 678226465),
    Film(title: "Interstellar", releaseYear: 2014, genre: .sciFi, revenue: 723791071)
]

let brando = Actor(name: "Marlon Brando", birthYear: 1924)
brando.addActedFilm(filmTitle: movieArray[0])

let bale = Actor(name: "Christian Bale", birthYear: 1974)
bale.addActedFilm(filmTitle: movieArray[1])

let travolta = Actor(name: "John Travolta", birthYear: 1954)
travolta.addActedFilm(filmTitle: movieArray[2])

let matthew = Actor(name: "Matthew McConaughey", birthYear: 1969)
matthew.addActedFilm(filmTitle: movieArray[4])

let tom = Actor(name: "Tom Hanks", birthYear: 1961)
tom.addActedFilm(filmTitle: movieArray[3])

var actorsArray = [brando, bale, travolta, matthew, tom]

var actorsDict = actorsArray.reduce(into: [:]) { dict, actor in
    dict[actor.name, default: []].append(actor.actedFilms[0].title)
}

print(actorsDict)
print("\n")


// MARK: 7. გამოიყენეთ map, იმისთვის რომ დაბეჭდოთ ყველა ფილმის სათაურების სია ამავე ფილმების მასივიდან

var filmTitles = movieArray.map { $0.title }

print("ფილმების სათაურების სია: \(filmTitles)")
print("\n")


// MARK: 8. reduce ფუნქციის გამოყენებით დაიანგარიშეთ ამ ყველა ფილმების გამოშვების საშუალო წელი.

var averageReleaseDate = movieArray.reduce(0) { $0 + $1.releaseYear / movieArray.count }

print("ფილმების გამოშვების საშუალო წელი: \(averageReleaseDate)")
print("\n")


// MARK: 9. შექმენით კლასი SuperHero, რომელიც შეიცავს შემდეგ ველებს:
//name სუპერ გმირის სახელი
//superPower  სუპერ ძალა
//level - PowerLevel enum-ის ტიპის,
//და allies ამავე ტიპის მოკავშირეების ჩამონათვალი,
//დაამატეთ ინიციალიზაციის და დეინიციალიზაციის მეთოდები

final class SuperHero {
    var name: String
    var superPower: [String]
    var level: PowerLevel
    var allies: [SuperHero]
    
    init(name: String, superPower: [String], level: PowerLevel, allies: [SuperHero]) {
        self.name = name
        self.superPower = superPower
        self.level = level
        self.allies = allies
    }
    
    deinit {
        print("\(name) now is usual 👷🏿‍♂️ in this world")
    }
    
    //ის ვინც გახდება გმირის ძმაკაცი ვისთანაც გამოვძახებთ ამ ფუნქციას, ესეც ავტომატურად უძმაკაცდება
    func addAlly(friend: SuperHero...) {
        friend.map { allies.append($0) }
        
        friend.map { bro in
            bro.allies.append(self)
        }
    }
    
    func uniquePowers(heroes: SuperHero...) -> Set<String> {
        var allPowers = [superPower]

        heroes.map { power in
            allPowers.append(power.superPower)
        }
                
        var uniques = allPowers.reduce(Set<String>()) { Set($0).symmetricDifference(Set($1)) }
        
        return uniques
    }
}


// MARK: 10. შექმენით Enum PowerLevel, რომელიც მოიცავს შემდეგ დონეებს: weak, average, strong, super და დაამატეთ აღწერის მეთოდი რომელიც დააბრუნებს level-ს ტექსტური ფორმით.

enum PowerLevel {
    case weak, average, strong, `super`
    
    func description() -> String {
        switch self {
        case .weak:
            return "level is weak"
        case .average:
            return "level is average"
        case .strong:
            return "level is strong"
        case .super:
            return "level is super"
        }
    }
}


// MARK: 12.  მეთოდი addAlly დაამატებს მოკავშირეების სიას, შექმენით 2 SuperHero ობიექტი და გახადეთ ისინი მოკავშირეები.

var spiderMan = SuperHero(name: "Spider Man", superPower: ["Spider-Sense", "web shooter", "skills"], level: .strong, allies: [])
var batman = SuperHero(name: "Batman", superPower: ["intellect", "wealth", "skills", "strength"], level: .strong, allies: [])
var aquaMan = SuperHero(name: "Aqua Man", superPower: ["breathe underwater", "telepathically", "strength", "skills"], level: .super, allies: [])

batman.addAlly(friend: aquaMan, spiderMan)


// MARK: 11. uniquePowers ყველა გმირისათვის და დააბრუნებს  უნიკალური ძალების სიას
batman.uniquePowers(heroes: aquaMan, spiderMan)

//deinit doc.
var doctorStrange: SuperHero? = SuperHero(name: "Doctor Strange", superPower: ["telepathy", "float"], level: .super, allies: [aquaMan, batman])

doctorStrange = nil
