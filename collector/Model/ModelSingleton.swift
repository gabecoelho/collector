//
//  ModelSingleton.swift
//  collector
//
//  Created by Gabriel Coelho on 1/27/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import Foundation

class ModelSingleton {
    static var categories: [String] = ["Category 1", "Category 2"]
    static var items: [Item] = [Item(title: "Item1", description: "This is my item #1", rating: 4, image: "photoString"), Item(title: "Item2", description: "This is my item #2", rating: 3, image: "photoString2")]
    static var categoryMap: [String : [Item]] = ["Category 1": [items[0]], "Category 2": [items[1]]]
    
    static let sharedInstance = ModelSingleton()
    
    private init(){}
}
