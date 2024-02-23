//
//  IndividualRecipie.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/02/2024.
//

import SwiftUI

struct IndividualRecipie: View {
    @State var recipie: Recipie
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Image"){
                    AsyncImage(url: URL(string: recipie.imageURL)){ image in
                        image.resizable().aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
                Section("Ingredients"){
                    Text("\(recipie.displayInfo)")
                }
                Section("Info"){
                    Text("Rating: \(recipie.rating)/5")
                    Toggle(isOn: $recipie.isFavourite){
                        Text("Favourite \(String(recipie.isFavourite))")
                    }
                }
            }
            .navigationTitle(recipie.name)
        }
    }
}

#Preview {
    IndividualRecipie(recipie: Recipie.exampleRecipies[0])
}
