import UIKit

//1. შექმენით მასივი `fruits`, რომელიც შეიცავს 5 ხილის სახელს. გამოიყენეთ `forEach` მეთოდი, რომ დაბეჭდოთ თითოეული ხილის სახელი ცალ-ცალკე ხაზზე.

var fruits = ["Mango", "Pineapple", "Papaya", "Coconut", "Passionfruit"];

fruits.forEach { print($0) }
