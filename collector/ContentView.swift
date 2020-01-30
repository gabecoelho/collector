//
//  ContentView.swift
//  collector
//
//  Created by Gabriel Coelho on 1/23/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedView: Int = 0
    @State var categories: [String] = ["Category 1", "Category 2"]
    @State var items: [Item] = [Item(title: "Item1", description: "This is my item #1", rating: 4, image: UIImage(named: "memoji")), Item(title: "Item2", description: "This is my item #2", rating: 3, image: UIImage(named: "memoji"))]
    @State var categoryMap: [String : [Item]] = [:]
    
    init() {
        self._categoryMap = State(initialValue: ["Category 1": [items[0]], "Category 2": [items[1]]])
    }
    
    
    var body: some View {
        NavigationView {
            TabView(selection: self.$selectedView) {
                ItemList(categories: self.$categories, items: self.$items, categoryMap: self.$categoryMap)
                  .tabItem {
                      Image(systemName: "list.dash")
                      Text("List")
                  }.tag(0)
                NewItem(categories: self.$categories, items: self.$items, categoryMap: self.$categoryMap)
                  .tabItem {
                      Image(systemName: "plus.circle.fill")
                      Text("Add New Item")
                  }.tag(1)
            }
            .navigationBarTitle("The Collector")
            .navigationBarItems(trailing:
                NavigationLink(destination: NewCategory(categories: self.$categories)) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Category")
                    }
                }
            )
        }
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
