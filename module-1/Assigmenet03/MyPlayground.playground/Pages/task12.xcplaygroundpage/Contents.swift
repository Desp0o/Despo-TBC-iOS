//: [Previous](@previous)

//12. შქმენით Int ტიპის ცვლადი და მიანიჭეთ მას ორნიშნა მნიშვნელობა, შეამოწმეთ შედგება თუ არა ეს რიცხვი ერთი და იგივე ციფრებისგან.


import Foundation

var number = 11;
let secondNum = number % 10;
let firstNum = number / 10;

if firstNum == secondNum {
    print("first number \(firstNum) and second number \(secondNum) are equals")
}else{
    print("first number \(firstNum) and second number \(secondNum) are not equals")
}


//: [Next](@next)
