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
    @State var categories: [String] = ["Sneakers", "Electronics"]
    @State var items: [Item] = [Item(title: "Pi 3B+", description: "This is the PI I use as a firewall. Need to get a v4", rating: 2, image: UIImage(named: "pi")), Item(title: "Nike Stefan Janoski", description: "I absolutely love this pair.", rating: 5, image: UIImage(named: "janoski"))]
    @State var categoryMap: [String : [Item]] = [:]
    
    init() {
        self._categoryMap = State(initialValue: ["Sneakers": [items[1]],"Electronics": [items[0]]])
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
