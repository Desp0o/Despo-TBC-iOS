//: [Previous](@previous)

//12. შექმენით ფუნქცია performOperation, რომელსაც აქვს ერთი closure ტიპის პარამეტრი operation. ფუნქციამ უნდა დაბეჭდოს “ოპერაცია დაიწყო” და შემდეგ გამოიძახოს operation. გამოიძახეთ ეს ფუნქცია და closure-ს შიგნით დაბეჭდეთ “ოპერაცია დასრულდა”.

import Foundation

// MARK: არ ვიცი ზუსტად რომელი კოდი უფრო სწორია ამ შემთხვევაში )

var myClosure = {
    print("ოპერაცია დასრულდა")
}

func performOperation(operation: () -> Void) {
    print("ოპერაცია დაიწყო")
    operation()
}

performOperation(operation: myClosure)

