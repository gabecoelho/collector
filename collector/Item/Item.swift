//
//  Item.swift
//  collector
//
//  Created by Gabriel Coelho on 1/25/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import Foundation
import SwiftUI

struct Item: Hashable {
    var title: String
    var description: String
    var rating: Int
    var image: UIImage?
}
