//
//  OwnedItem.swift
//  Store
//
//  Created by Kevin on 2023-05-21.
//

import Foundation

class OwnedItem: Item {
    var minutesUsed: Int
    
    init(id: Int, title: String, price: Double, minutesUsed: Int) {
        self.minutesUsed = minutesUsed
        super.init(id: id, title: title, price: price)
    }
}
