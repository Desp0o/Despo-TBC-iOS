//: [Previous](@previous)

//9. შექმენით ორი Int ტიპის ცვლადი: number და sum. გამოიყენეთ while ციკლი number-ის ციფრების ჯამის გამოსათვლელად და შედეგი შეინახეთ sum-ში. მაგალითად, თუ number არის 1234, sum უნდა იყოს 10 (1+2+3+4). დაბეჭდეთ საწყისი რიცხვი და მიღებული ჯამი.

import Foundation

var number = 1234
var sum = 0
var temp = number

while temp > 0 {
    var lastNum = temp % 10
    sum += lastNum
    temp /= 10
}
//: [Next](@next)


print("number is \(number) and sum is \(sum)")
