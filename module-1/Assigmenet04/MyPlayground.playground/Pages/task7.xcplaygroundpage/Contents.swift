//: [Previous](@previous)

//7. შექმენით ორი სხვადასხვა ტიპის მასივი: `names` (String-ების მასივი) და `ages` (Int-ების მასივი). გამოიყენეთ `zip` ფუნქცია ამ ორი მასივის გასაერთიანებლად, შემდეგ კი `sorted` მეთოდი, რომ დაალაგოთ მიღებული კოლექცია ასაკის მიხედვით. დაბეჭდეთ შედეგი.

import Foundation

var names = ["Frodo", "Aragorn", "Legolas", "Gandalf", "Gimli"]
var ages = [50, 87, 2900, 5900, 139]
var heroes = Array(zip(names, ages)).sorted { $0.1 > $1.1 }

print(heroes)

//: [Next](@next)
