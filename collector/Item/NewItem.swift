//
//  NewItem.swift
//  collector
//
//  Created by Gabriel Coelho on 1/27/20.
//  Copyright © 2020 Gabe. All rights reserved.
//

import SwiftUI

struct NewItem: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var ratings = [1, 2, 3, 4, 5]
    
    @Binding var categories: [String]
    @Binding var items: [Item]
    @Binding var categoryMap: [String : [Item]]
    
    @State private var showingAlert = false
    @State private var selectedCategory = 0
    @State private var title = ""
    @State private var description = ""
    @State private var image: Image?
    @State private var selectedRating = 0
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedCategory, label: Text("Category:")) {
                        ForEach(0 ..< self.categories.count) { selection in
                            Text(self.categories[selection]).tag(selection)
                        }
                    }
                    TextField("Title:", text: self.$title)
                    TextField("Description:", text: self.$description)
//                    TextField("Image:", text: self.$image)
                    Picker(selection: $selectedRating, label: Text("Rating:")) {
                        ForEach(0 ..< ratings.count, id: \.self) {
                            Text("\(self.ratings[$0])").tag([$0])
                        }
                    }
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color.secondary)
                               if image != nil {
                                   image?
                                   .resizable()
                                   .scaledToFit()
                               }
                               else {
                                   Text("Tap to select picture")
                                       .foregroundColor(.white)
                                       .font(.headline)
                               }
                           }
                           .onTapGesture {
                               self.showingImagePicker = true
                           }
                        }
                       
                    
                    Button(action: {
                    // Pop view, show alert, and add new item to model
                        self.showingAlert = true
                        
//                        let newItem = Item(title: self.title, description: self.description, rating: self.selectedRating + 1, image: self.image)
                        let newItem = Item(title: self.title, description: self.description, rating: self.selectedRating + 1, image: UIImage())
                        let strSelectedCategory: String = self.categories[self.selectedCategory]
                        
                        self.items.append(newItem)
                        
                        // If category does not already exist in the map, create it and append new item
                        if (self.categoryMap[strSelectedCategory] == nil) {
                            self.categoryMap[strSelectedCategory] = [newItem]
                        }
                        else {
                            self.categoryMap[strSelectedCategory]?.append(newItem)
                        }
                        
                        // Reset form values
                        self.title = ""
                        self.description = ""
                        self.image = nil
                        self.selectedCategory = 0
                        self.selectedRating = 0
                    }, label: {
                        Text("Submit")
                    })
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Success!"), message: Text("Item created successfully"), dismissButton: .default(Text("OK!")))
                    }
                }
        }
            .navigationBarTitle("Create New Item", displayMode: .inline)
            .sheet(isPresented: $showingImagePicker,
                   onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
                    
            }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

#if DEBUG
struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        NewItem(categories: .constant(["Test"]), items: .constant([Item(title: "title1", description: "description1", rating: 4, image: UIImage()), Item(title: "title2", description: "description2", rating: 3, image: UIImage())]), categoryMap: .constant(["Test1":[Item(title: "title1", description: "description1", rating: 4, image: UIImage()), Item(title: "title2", description: "description2", rating: 3, image: UIImage())]]))
    }
}
#endif
