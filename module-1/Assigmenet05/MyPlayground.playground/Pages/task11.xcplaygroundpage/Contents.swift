//: [Previous](@previous)

//11. დაწერეთ ფუნქცია createCounter, რომელიც აბრუნებს closure-ს. ეს ფუნქცია უნდა შეიცავდეს ლოკალურ ცვლადს count, რომელიც ინიციალიზდება 0-ით. დაბრუნებულმა closure-მ უნდა გაზარდოს ეს count ცვლადი ყოველ გამოძახებაზე და დააბრუნოს მისი ახალი მნიშვნელობა.

import Foundation

func createCounter() -> () -> Int {
    var count = 0
    
    return {
        count += 1
        return count
    }
}

var result = createCounter()

print(result())
print(result())
print(result())

//: [Next](@next)
