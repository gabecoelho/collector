//
//  NewEntry.swift
//  collector
//
//  Created by Gabriel Coelho on 1/26/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import SwiftUI

struct NewEntry: View {
    var types = ["Category", "Item"]

    @State private var selectedTypes = 0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedTypes, label: Text("Type")) {
                        ForEach(0 ..< types.count) {
                            Text(self.types[$0])
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                }
            }
            .navigationBarTitle("Create New")
        }
    }
}

struct NewEntry_Previews: PreviewProvider {
    static var previews: some View {
        NewEntry()
    }
}
