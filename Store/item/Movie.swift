//
//  Movie.swift
//  Store
//
//  Created by Kao on 2023-05-20.
//

import Foundation

class Movie: Item {
    var runningTime: Int
    
    override var info: String {
        """
        \(super.info)
        Length: \(self.runningTime) min
        """
    }
    
    init(id: Int, title: String, price: Double, runningTime: Int) {
        self.runningTime = runningTime
        super.init(id: id, title: title, price: price)
    }
}
