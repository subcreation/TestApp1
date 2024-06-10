//
//  Item.swift
//  TestApp1
//
//  Created by Nathanael Roberton on 6/10/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
