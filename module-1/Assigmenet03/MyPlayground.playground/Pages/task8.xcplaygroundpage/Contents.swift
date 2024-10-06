//: [Previous](@previous)

//8. დაწერეთ if-else if-else სტრუქტურა, რომელიც შეამოწმებს Int ტიპის ცვლადის მნიშვნელობას და დაბეჭდავს შესაბამის შეტყობინებას (მაგალითად, დადებითია, უარყოფითია თუ ნულის ტოლი).

import Foundation

var num = 0

if num == 0 {
    print("\(num) is zero")
} else if num % 2 == 0 {
    print("\(num) is even")
} else {
    print("\(num) is odd")
}

//: [Next](@next)
