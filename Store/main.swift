//
//  main.swift
//  Store
//
//  Created by Kao on 2023-05-20.
//

import Foundation

// Game
let g1 = Game(id: 1,
              title: "Kingdom Rush Origins",
              price: 19.79,
              publisher: "Ironhide Game Studio",
              isMultiplayer: false)

let g2 = Game(id: 2,
              title: "Kingdom Rush Origins II",
              price: 24.99,
              publisher: "Ironhide Game Studio",
              isMultiplayer: true)


let g3 = Game(id: 3,
              title: "Super Mario",
              price: 17.49,
              publisher: "Nintendo",
              isMultiplayer: true)

// Movie
let m1 = Movie(id: 4, title: "The Hunger Games: Catching Fire", price: 12.99, runningTime: 146)

let m2 = Movie(id: 5, title: "The Hunger Games: Mockingjay", price: 13.79, runningTime: 123)

let m3 = Movie(id: 6, title: "The Super Mario Bros. Movie", price: 15.39, runningTime: 92)

// Store
let store = Store()
store.items = [g1, g2, g3, m1, m2, m3]

// Customer
let c1 = Customer()


// program test code

// searching products
print("\n*************** SEARCHING PRODUCTS ***************\n")
print("> Searching products including the keyword 'mario'...")             // case: game & movie
store.findByTitle(keyword: "mario")

print()
print("> Searching products including the keyword 'II'...")                // case: 1 result
store.findByTitle(keyword: "II")

print()
print("> Searching products including the keyword 'burger'...")             // case: no result
store.findByTitle(keyword: "burger")


// checking balance
print("\n*************** CHECKING BALANCE ***************\n")
print("> Customer c1 is checking their gift card balance...")
print("> Balance: $\(c1.balance)")

print()
print("> Customer c1 is reloading $25.79 to their gift card...")            // case: success
c1.reloadAccount(amount: 25.79)
print("> Balance: $\(c1.balance)")

print()
print("> Customer c1 is reloading $0 to their gift card...")                // case: fail
c1.reloadAccount(amount: 0)
print("> Balance: $\(c1.balance)")

print()
print("> Customer c1 is reloading $-0.5 to their gift card...")             // case: fail
c1.reloadAccount(amount: -0.5)
print("> Balance: $\(c1.balance)")

// purchasing products
print("\n*************** PURCHASING PRODUCTS ***************\n")
print()
print("> Customer c1 is purchasing the product where product.id = 7...")    // case: not existing item, sufficient fund
store.buyItem(c: c1, itemId: 7)

print()
print("> Balance: $\(c1.balance)")

print()
print("> Customer c1 is purchasing the product where product.id = 1...")    // case: existing item, sufficient fund
store.buyItem(c: c1, itemId: 1)

print()
print("> Customer c1 is purchasing the product where product.id = 1...")    // case: existing item, sufficient fund, bought already
store.buyItem(c: c1, itemId: 1)

print()
print("> Balance: $\(c1.balance)")

print()
print("> Customer c1 is purchasing the product where product.id = 4...")    // case: existing item, sufficient fund
store.buyItem(c: c1, itemId: 4)

print()
print("> Balance: $\(c1.balance)")

print()
print("> Customer c1 is purchasing the product where product.id = 5...")    // case: existing item, insufficient fund
store.buyItem(c: c1, itemId: 5)

print()
print("> Balance: $\(c1.balance)")

// using products
print("\n*************** USING PRODUCTS ***************\n")
print("> Customer c1 used the product where product.id = 1 for 35 minutes...")
c1.useItem(id: 1, numMinutes: 35)


// refunding products
print("\n*************** REFUNDING PRODUCTS ***************\n")
print("> Customer c1 is refunding the product where product.id = 1...")       // case: cannot refund as item used for >= 30 mins
store.issueRefund(c: c1, itemId: 1)
print("> Balance: $\(c1.balance)")

print()
print("> Customer c1 is refunding the product where product.id = 5...")       // case: cannot refund as item is not bought
store.issueRefund(c: c1, itemId: 5)
print("> Balance: $\(c1.balance)")

print()
print("> Customer c1 is refunding the product where product.id = 4...")       // case: cannot refund as item is not bought
store.issueRefund(c: c1, itemId: 4)
print("> Balance: $\(c1.balance)")
