//
//  Game.swift
//  Store
//
//  Created by Kao on 2023-05-21.
//

import Foundation

class Game: Item {
    let publisher: String
    let isMultiplayer: Bool
    
    override var info: String {
        """
        \(super.info)
        Publisher: \(self.publisher)
        Has Multiplayer: \(self.isMultiplayer)
        """
    }
    
    init(id: Int, title: String, price: Double, publisher: String, isMultiplayer: Bool) {
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        super.init(id: id, title: title, price: price)
    }
}
