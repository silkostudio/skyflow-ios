//
//  Item.swift
//  Skyflow
//
//  Created by Florian N on 04/05/2026.
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
