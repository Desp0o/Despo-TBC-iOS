import Foundation

//შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება შემდეგი თვისებები:
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
    
    func description()  {
        print("info: \n title: \(title) \n release year: \(releaseYear) \n genre: \(genre) \n revenue: \(revenue)")
    }
    
    func removeFilm(films: inout [String], title: String) {
            films.removeAll { $0 == title }
        }
}

var movieList = ["lotr", "harry potter", "Interstellar"]
var geroge = Film(title: "lotr", releaseYear: 1993, genre: .sciFi, revenue: 209123.1)

print("inited movie list is: \(movieList)")
geroge.removeFilm(films: &movieList, title: "lotr")
print("film removed movie list is: \(movieList))")
print("🎥")

//2. შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
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
        let currentYear =  Calendar.current.component(.year, from: Date())
        
        return currentYear - birthYear
    }
}

//3. Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.

// MARK: - პირველი ამოცანში ჩავწერე ეს ფუნქცია

//4. შექმენით კლასი Actor, რომელიც არიას Person კლასის მემკვიდრე კლასი
//Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ ნათამაშებ ფილმებს დაამატებს სიაში.

class Actor: Person {
    var actedFilms: [String] = []
    
    func addActedFilm(filmTitle: String) {
        actedFilms.append(filmTitle)
    }
}

var viggo = Actor(name: "Viggo Mortensen", birthYear: 1958)

print("Actor acted movies is: \(viggo.actedFilms)")

viggo.addActedFilm(filmTitle: "Lord of The Rings")
viggo.addActedFilm(filmTitle: "Captain Fantastic")

print("Actor acted movies is: \(viggo.actedFilms)")
print("🎥")


//5. შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი.
//დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.

class Director: Person {
    var directedFilms: [String] = []
    var totalRevenue: Double = 0
 
    func updateCareer(movieList: [String: Double]) {
        movieList.map { (movie, revenue) in
            directedFilms.append(movie)
            totalRevenue += revenue
        }
    }
}

var movieListWithRevenue: [String: Double] = [
    "LOTR" : 1137689127,
    "Avatar" : 1017107150
]

var peter = Director(name: "Peter Jackson", birthYear: 1961)

print("Peter's directed films are: \(peter.directedFilms), and total revenue is: \(peter.totalRevenue)")

peter.updateCareer(movieList: movieListWithRevenue)

print("Peter's directed films are: \(peter.directedFilms), and total revenue is: \(peter.totalRevenue)")
print("🎥")

