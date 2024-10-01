import Foundation

//MARK: 1. შექმენით "Genre" ტიპის enum, რომელიც შეიცავს წიგნის ჟანრებს (მაგ: fiction, nonFiction, mystery, sciFi, biography). დაამატეთ computed property "description", რომელიც დააბრუნებს ჟანრის აღწერას.

enum Genre {
    case fiction
    case nonFiciton
    case mystery
    case sciFi
    case biography
    
    var description: String {
        switch self {
        case .fiction:
            return "Genre of this book is: fiction"
        case .nonFiciton:
            return "Genre of this book is: nonFiciton"
        case .mystery:
            return "Genre of this book is: mystery"
        case .sciFi:
            return "Genre of this book is: sciFi"
        case .biography:
            return "Genre of this book is: biography"
        }
    }
}

//MARK: 2. შექმენით enum "ReadingLevel" მნიშვნელობებით: beginner, intermediate, advanced. შემდეგ შექმენით პროტოკოლი "Readable" შემდეგი მოთხოვნებით:
//   - "title: String" ფროფერთი
//   - "author: String" ფროფერთი
//   - "publicationYear: Int" ფროფერთი
//   - "readingLevel: ReadingLevel" ფროფერთი
//   - "read()" მეთოდი, რომელიც დაბეჭდავს ინფორმაციას წიგნის წაკითხვის შესახებ, მაგ: "გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი" ან რამე სხვა, მიეცით ფანტაზიას გასაქანი 🤘

enum ReadingLevel {
    case beginner
    case intermediate
    case advanced
}

protocol Readable {
    var title: String { get }
    var author: String { get }
    var publicationYear: Int { get }
    var readingLevel: ReadingLevel { get }
    
    func read()
}


//MARK: 3. შექმენით სტრუქტურა "Book", რომელიც დააკმაყოფილებს "Readable" პროტოკოლს. დაამატეთ "genre: Genre" ფროფერთი და "description()" მეთოდი, რომელიც დაბეჭდავს სრულ ინფორმაციას წიგნზე.

struct Book: Readable {
    var title: String
    var author: String
    var publicationYear: Int
    var readingLevel: ReadingLevel
    var genre: Genre
    
    func read() {
        print("გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი, მაგრამ რა შევიდა თავში ეგ სხვა საკითხია.")
    }
    
    func description() {
        print("ინფორმაცია წიგნის შესახებ: \nსათაური: \(title) \nავტორი: \(author) \nგამოშვების წელი: \(publicationYear) \nსირთულე: \(readingLevel)")
    }
}

//MARK: 4. შექმენით "Library" კლასი შემდეგი ფროფერთებით:
//   - "name: String" - ბიბლიოთეკის სახელი
//   - "books: [Book]" - წიგნების მასივი
//   დაამატეთ მეთოდები:
//   - "add(book: Book)" - წიგნის დამატება
//   - "removeBookWith(title: String)" - წიგნის წაშლა სათაურის მიხედვით
//   - "listBooks()" - ყველა წიგნის ჩამონათვალის დაბეჭდვა
//  გააფართოეთ “Library” კლასი “filterBooks” მეთოდით რომელიც არგუმენტად მიიღებს ქლოჟერს და დააბრუნებს ამ ქლოჟერის გამოყენებით გაფილტრულ წიგნთა მასივს.

class Library {
    var name: String
    var books: [Book]
    
    init(name: String, books: [Book] = []) {
        self.name = name
        self.books = books
    }
    
    func add(book: Book) {
        books.append(book)
    }
    
    func removeBookWith(title: String) {
        if books.contains(where: { $0.title == title }) {
            books.removeAll { $0.title == title }
        } else {
            print("ბიბლიოთეკაში არ მოიძებნა მსგავსი წიგნი 📚")
        }
    }
    
    func listBooks() {
        books.map { print($0.title) }
    }
}

extension Library {
    func filterBooks(myClosure: ([Book]) -> [Book]) -> [Book] {
        return myClosure(books)
    }
}


//MARK: 5.  შექმენით generic ფუნქცია groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]], რომელიც დააჯგუფებს წიგნებს კითხვის დონის მიხედვით. გამოიყენეთ ეს ფუნქცია ბიბლიოთეკის წიგნებზე და დაბეჭდეთ შედეგი.

func groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]] {
    return books.reduce(into: [:]) { dict, book in
        dict[book.readingLevel, default: []].append(book)
    }
}


//MARK: 6. შექმენით "LibraryMember" კლასი შემდეგი ფროფერთებით:
//   - "id: Int"
//   - "name: String"
//   - "borrowedBooks: [Book]"
//   დაამატეთ მეთოდები:
//   - "borrowBook(_ book: Book, from library: Library)" - წიგნის გამოწერა ბიბლიოთეკიდან
//   - "returnBook(_ book: Book, to library: Library)" - წიგნის დაბრუნება ბიბლიოთეკაში

class LibraryMember {
    var id: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(id: Int, name: String, borrowedBooks: [Book] = []) {
        self.id = id
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(_ book: Book, from  library: Library) {
        if library.books.contains(where: { $0.title == book.title }) {
            library.removeBookWith(title: book.title)
            borrowedBooks.append(book)
        } else {
            print("შენი სასურველი წიგნი არ გვაქვს ბიბლიოეთკაში 🤓")
        }
    }
    
    func returnBook(_ book: Book, to library: Library) {
        if borrowedBooks.contains(where: { $0.title == book.title }) {
            borrowedBooks.removeAll() { $0.title == book.title }
            library.add(book: book)
        } else {
            print("შენ არ გაქვს მსგავსი წიგნი 🧐")
        }
    }
}

//WARNING
//MARK: 7. შექმენით მინიმუმ 5 "Book" ობიექტი და 1 "Library" ობიექტი. დაამატეთ წიგნები ბიბლიოთეკაში "add(book:)" მეთოდის გამოყენებით. შემდეგ:
//   - გამოიყენეთ "listBooks()" მეთოდი ყველა წიგნის ჩამოსათვლელად
//   - წაშალეთ ერთი წიგნი "removeBookWith(title:)" მეთოდის გამოყენებით
//   - გამოიყენეთ "filterBooks" მეთოდი და დაბეჭდეთ მხოლოდ ის წიგნები, რომლებიც გამოცემულია 2000 წლის შემდეგ

let book1 = Book(title: "book1", author: "auth1", publicationYear: 1954, readingLevel: .intermediate, genre: .mystery)
book1.read() // read ფუნქცია მეორე დავალებიდან
book1.description()

let book2 = Book(title: "book2", author: "auth2", publicationYear: 2001, readingLevel: .beginner, genre: .sciFi)
let book3 = Book(title: "book3", author: "auth3", publicationYear: 2024, readingLevel: .advanced, genre: .sciFi)
let book4 = Book(title: "book4", author: "auth4", publicationYear: 1999, readingLevel: .beginner, genre: .fiction)
let book5 = Book(title: "book5", author: "auth5", publicationYear: 2014, readingLevel: .intermediate, genre: .nonFiciton)
let book6 = Book(title: "book6", author: "auth6", publicationYear: 2010, readingLevel: .advanced, genre: .biography)

let myLib = Library(name: "My Lib")
myLib.add(book: book1)
myLib.add(book: book2)
myLib.add(book: book3)
myLib.add(book: book4)
myLib.add(book: book5)
myLib.add(book: book6)

var booksArray = [book1, book2, book3, book4, book5, book6]

myLib.listBooks()
myLib.removeBookWith(title: "book6")

//ქლოჟერი მეოთხე დავალებიდან
let bookFiltering: ([Book]) -> [Book] = { $0.filter { $0.publicationYear > 2000 } }

let booksFrom2000 = myLib.filterBooks(myClosure: bookFiltering)
//print(booksFrom2000)

// dictionary მეხუთე დავალებიდან
let groupedBooks = groupBooksByLevel(booksArray)
//print(groupedBooks)


//MARK: 8. შექმენით მინიმუმ 2 "LibraryMember" ობიექტი. თითოეული წევრისთვის:
//   - გამოიწერეთ 2 წიგნი "borrowBook(_:from:)" მეთოდის გამოყენებით
//   - დააბრუნეთ 1 წიგნი "returnBook(_:to:)" მეთოდის გამოყენებით
//   დაბეჭდეთ თითოეული წევრის გამოწერილი წიგნების სია

let nerdMember = LibraryMember(id: 1, name: "წიგნის ჭია")
let looserMember = LibraryMember(id: 2, name: "ოროსანი")

nerdMember.borrowBook(book1, from: myLib)
nerdMember.borrowBook(book2, from: myLib)
//print(nerdMember.borrowedBooks)

nerdMember.returnBook(book6, to: myLib)
//print(nerdMember.borrowedBooks)


//looserMember.borrowBook(book1, from: myLib) // ვეღარ აიღებს ეს ოროსანი პირველ წიგნს რადგან უკვე კითხულობენ
looserMember.borrowBook(book5, from: myLib)
looserMember.returnBook(book5, to: myLib)

//print(looserMember.borrowedBooks)
