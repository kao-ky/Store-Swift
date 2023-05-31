//
//  IsPurchasableProtocol.swift
//  Store
//
//  Created by Kao on 2023-05-20.
//

import Foundation

protocol isPurchasable {
    var info: String { get }
    
    func printReceipt(isRefund: Bool, amount: Double)
}
