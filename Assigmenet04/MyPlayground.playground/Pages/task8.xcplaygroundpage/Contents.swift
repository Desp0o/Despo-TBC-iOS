//: [Previous](@previous)

//8. დაწერეთ ფუნქცია `groupWordsByLength`, რომელიც იღებს String-ების მასივს და იყენებს `reduce` მეთოდს, რომ დააჯგუფოს სიტყვები მათი სიგრძის მიხედვით Dictionary-ში. გამოიძახეთ ეს ფუნქცია სხვადასხვა სიტყვების მასივზე და დაბეჭდეთ შედეგი.
//
//მაგალითად: input: ["apple", "banana", "kiwi", "grape", "strawberry"]
//
//      output: [4: ["kiwi"], 5: ["apple", "grape"], 6: ["banana"], 10: ["strawberry"]]

import Foundation

func groupWordsByLength(_ array: [String]) -> [Int: [String]] {
    
    let result = array.reduce(into: [Int: [String]]()) { dict, word in
        let length = word.count
        dict[length, default: []].append(word)
    }
    
    return result
}

groupWordsByLength(["apple", "banana", "kiwi", "grape", "strawberry"])
groupWordsByLength(["Mango", "Pineapple", "Papaya", "Banana", "Coconut", "Guava", "Durian", "Passion Fruit", "Jackfruit", "Lychee"])

//: [Next](@next)

