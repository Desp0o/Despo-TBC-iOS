//: [Previous](@previous)

//12. დაწერეთ ფუნქცია `executeInOrder`, რომელიც იღებს ვარიადულ closure პარამეტრს (ყველა closure-ს აქვს ტიპი `() -> Void`). ფუნქციამ უნდა შეასრულოს ეს closure-ები მიმდევრობით, ყოველი შესრულების წინ და შემდეგ კი დაბეჭდოს შესაბამისი შეტყობინება. გამოიძახეთ ეს ფუნქცია რამდენიმე სხვადასხვა ოპერაციით და დააკვირდით შესრულების თანმიმდევრობას.

import Foundation

var firstOperation: () -> Void = {
    print("Executing closure 1...")
    print("First operation is running.")
    print("Finished executing closure 1.")
}

var secondOperation: () -> Void = {
    print("Executing closure 2...")
    print("Second operation is running.")
    print("Finished executing closure 2.")
}

var thirdOperation: () -> Void = {
    print("Executing closure 3...")
    print("Third operation is running.")
    print("Finished executing closure 3.")
}

func executeInOrder(_ closures: ()-> Void...) {
    for closure in closures {
        closure()
        print("\n")
    }
}

executeInOrder(firstOperation, secondOperation, thirdOperation)

//: [Next](@next)
