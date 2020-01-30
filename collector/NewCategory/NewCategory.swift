//
//  NewCategory.swift
//  collector
//
//  Created by Gabriel Coelho on 1/27/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import SwiftUI

struct NewCategory: View {
    
    @State private var categoryName: String = ""
    @Binding var categories: [String]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {

       NavigationView {
            Form {
                Section {
                    TextField("Enter Your New Category Name:", text: $categoryName)
                   Button(action: {
                    // Pop view
                    self.presentationMode.wrappedValue.dismiss()
                    self.categories.append(self.categoryName)
                    print("Created new category: \(self.$categoryName)")
                    dump(self.$categories)
                    }, label: {
                        Text("Submit")
                    })
                }
        }
        .navigationBarTitle("New Category")
        }
    }
}

#if DEBUG
struct NewCategory_Previews: PreviewProvider {
    static var previews: some View {
        NewCategory(categories: .constant(["Test1", "Test 2"]))
    }
}
#endif
