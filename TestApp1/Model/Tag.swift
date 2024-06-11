//
//  Tag.swift
//  TestApp1
//
//  Created by Nathanael Roberton on 6/10/24.
//

import Foundation
import SwiftData

@Model
final class Tag {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
