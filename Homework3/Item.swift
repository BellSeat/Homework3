//
//  Item.swift
//  Homework3
//
//  Created by qingran shao on 5/5/24.
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
