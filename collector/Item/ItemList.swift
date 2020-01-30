//
//  ItemList.swift
//  collector
//
//  Created by Gabriel Coelho on 1/25/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import SwiftUI

struct ItemList: View {
    @Binding var categories: [String]
    @Binding var items: [Item]
    @Binding var categoryMap: [String : [Item]]
    var randomId = Int.random(in: 0 ... Int.max)
   
    var body: some View {
            List {
                ForEach(self.categories, id: \.self) { category in
                    Section(header: Text(category)
                        .onTapGesture {
                            print("Display items")
                            //TODO: Expand and close rows
                        }) {
                            if (self.categoryMap[category] != nil) {
                                ForEach(self.categoryMap[(category)]!, id: \.self) { newItem in
                                    ItemRow(item: newItem)
                                }
                            }
                            
                     }
                }
            }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
//        ItemList(categories: ["Test 1", "Test 2"], items: [Item(title: "title1", description: "description1", rating: 4, image: UIImage()), Item(title: "title2", description: "description2", rating: 3, image: UIImage())], categoryMap: ["Test1":[Item(title: "title1", description: "description1", rating: 4, image: UIImage()), Item(title: "title2", description: "description2", rating: 3, image: UIImage())]])
        ItemList(categories: .constant(["Test"]), items: .constant([Item(title: "title1", description: "description1", rating: 4, image: UIImage()), Item(title: "title2", description: "description2", rating: 3, image: UIImage())]), categoryMap: .constant(["Test1":[Item(title: "title1", description: "description1", rating: 4, image: UIImage()), Item(title: "title2", description: "description2", rating: 3, image: UIImage())]]))
    }
}
