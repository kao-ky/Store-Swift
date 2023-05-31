//
//  Customer.swift
//  Store
//
//  Created by Kevin on 2023-05-21.
//

import Foundation

class Customer {
    var itemsList: [OwnedItem] = []
    var balance: Double = 10
    
    func reloadAccount(amount: Double) {
        if amount < 0.01 {
            print("Error: You must reload at least $0.01.")
            return
        }
        self.balance += amount
    }
    
    func useItem(id: Int, numMinutes: Int) {
        for item in self.itemsList {
            if item.id == id {
                item.minutesUsed += numMinutes
            }
        }
    }
}
