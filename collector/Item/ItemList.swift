//
//  ItemList.swift
//  collector
//
//  Created by Gabriel Coelho on 1/25/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import SwiftUI

struct ItemList: View {
    @State var categoryState: [String: Bool] = [:]
    
    @Binding var categories: [String]
    @Binding var items: [Item]
    @Binding var categoryMap: [String : [Item]]
   
    var body: some View {
            List {
                ForEach(self.categories, id: \.self) { category in
                    Section(header: Text(category)
                        .font(.system(size: 25))
                        .bold()
                        .onTapGesture {
                            self.categoryState[category] = !self.isExpanded(category)
                        }) {
                            if (self.isExpanded(category)) {
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
    
    func isExpanded(_ category:String) -> Bool {
          categoryState[category] ?? false
     }
}
#if DEBUG
struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList(categories: .constant(["Test"]), items: .constant([Item(title: "title1", description: "description1", rating: 4, image: UIImage()), Item(title: "title2", description: "description2", rating: 3, image: UIImage())]), categoryMap: .constant(["Test1":[Item(title: "title1", description: "description1", rating: 4, image: UIImage()), Item(title: "title2", description: "description2", rating: 3, image: UIImage())]]))
    }
}
#endif
