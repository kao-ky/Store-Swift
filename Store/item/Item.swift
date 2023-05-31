//
//  Item.swift
//  Store
//
//  Created by Kao on 2023-05-20.
//

import Foundation

class Item: isPurchasable {
    var id: Int
    let title: String
    var price: Double
    var info: String {
        "\(self.title): $\(self.price)"
    }
    
    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }
    
    func printReceipt(isRefund: Bool, amount: Double) {
        
        var receipt: String
        
        if isRefund {
            receipt = """
                    -------------------------
                    REFUND RECEIPT
                    -------------------------
                    We are refunding the purchase of \(self.title)
                    Refund amount: $\(amount)
                    """
        } else {
            receipt = """
                    -------------------------
                    PURCHASE RECEIPT
                    -------------------------
                    Thank you for purchasing \(self.title)
                    Purchase amount: \(amount)
                    """
        }
        
        print(receipt)
    }
}
