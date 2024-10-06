//: [Previous](@previous)

//10. შექმენით String ტიპის ცვლადი სიტყვით და Int ტიპის ცვლადი სახელით count ნულის მნიშვნელობით. გამოიყენეთ for-in ციკლი სიტყვაში ხმოვნების (a, e, i, o, u) დასათვლელად. ყოველი ხმოვნის შემთხვევაში გაზარდეთ count ერთით. ციკლის დასრულების შემდეგ დაბეჭდეთ საწყისი სიტყვა და მასში ნაპოვნი ხმოვნების რაოდენობა.


import Foundation

var word = "Foundation"
let targetLetters = "aeiou"
var count = 0

for letter in word {
    for targetedLetter in targetLetters{
        if(targetedLetter == letter){
            count += 1
        }
    }
}

print("there is \(count) vowel letter in word \(word)")

print("-------------------")

let word2 = "pneumonoultramicroscopicsilicovolcanoconiosis"
let targetLetters2 = "aeiou"
var count2 = 0

for letter in word2{
    if targetLetters2.contains(letter){
        count2 += 1
    }
}

print("there is \(count2) vowel letter in word2 \(word2)")


//: [Next](@next)
