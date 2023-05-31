//
//  Store.swift
//  Store
//
//  Created by Kao on 2023-05-20.
//

import Foundation

enum ItemLabel: String {
    case MOVIE = "[MOVIE]"
    case GAME = "[GAME]"
}

class Store {
    var items: [Item] = []
    
    func buyItem(c: Customer, itemId: Int) {
        var itemToPurchase: Item?
        
        for item in self.items {
            if item.id == itemId {
                itemToPurchase = item
                break
            }
        }
        
        // if the store does not sell this item
        guard let item = itemToPurchase else {
            print("Error: Item [id: \(itemId)] does not exist in this store.")
            return
        }
        
        // if customer has already owned this item
        for item in c.itemsList {
            if item.id == itemId {
                print("Error: This item [id: \(itemId)] is already purchased.")
                return
            }
        }
        
        // if customer does not have enough money for this purchase
        if c.balance < item.price {
            print("Error: Insufficient balance for purchasing item [id: \(itemId)].")
            return
        }
        
        let itemToAdd = OwnedItem(id: item.id, title: item.title, price: item.price, minutesUsed: 0)
        
        c.balance -= item.price
        c.itemsList.append(itemToAdd)
        print("Purchase success!")
        item.printReceipt(isRefund: false, amount: item.price)
    }
    
    func issueRefund(c: Customer, itemId: Int) {
        var itemToRefund: OwnedItem?
        var index: Int?

        for (i, item) in c.itemsList.enumerated() {
            if item.id == itemId {
                itemToRefund = item
                index = i
                break
            }
        }
        
        guard let item = itemToRefund else {
            print("Error: No such purchased item.")
            return
        }
        
        if item.minutesUsed >= 30 {
            print("Error: Item cannot be refunded after using for 30 minutes.")
            return
        }
        
        c.balance += item.price
        c.itemsList.remove(at: index!)
        print("Refund success!")
        item.printReceipt(isRefund: true, amount: item.price)
    }
    
    func findByTitle(keyword: String) {
        var resultsList: [Item] = []
        
        for item in items {
            if item.title.uppercased().contains(keyword.uppercased()) {
                resultsList.append(item)
            }
        }
        
        if resultsList.isEmpty {
            print("Sorry, no matching items found.")
            return
        }
        
        for item in resultsList {
            if item is Movie {
                print("\(ItemLabel.MOVIE.rawValue) \(item.info)")
            }
            else if item is Game {
                print("\(ItemLabel.GAME.rawValue) \(item.info)")
            }
            print()
        }
    }
}
