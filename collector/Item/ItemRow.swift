//
//  ItemRow.swift
//  collector
//
//  Created by Gabriel Coelho on 1/25/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    
    var body: some View {
        HStack(spacing: 20) {
            Image(uiImage: item.image!)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(item.title).bold()
                Text(item.description)
            }
            
            Text(String(repeating: "⭐️", count: item.rating))
        }

    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Item(title: "Title", description: "Description", rating: 5, image: UIImage(named: "memoji")))
    }
}
