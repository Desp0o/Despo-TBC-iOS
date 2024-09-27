//: [Previous](@previous)

//11. შექმენით სტრინგ ტიპის ცვლადი და მიანიჭეთ მნიშვნელობა, დაბეჭდეთ მისი შებრუნებული მნიშვნელობა, მაგ: “xCode” -> “”edoCx”


import Foundation

var word = "Aloha"
var reversedWord = word.split(separator: "").reversed().joined(separator: "")

print("\(word) -> \(reversedWord)")


print("----------")

var word2 = "Hippopotamus"
var reversedWord2 = ""

for letter in stride(from: word2.count - 1, through: 0, by: -1) {
    let letterIndex = word2.index(word2.startIndex, offsetBy: letter)
    reversedWord2 += String(word2[letterIndex])
}

print(reversedWord2)

//: [Next](@next)
