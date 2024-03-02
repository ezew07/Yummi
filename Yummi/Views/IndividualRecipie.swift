//
//  IndividualRecipie.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/02/2024.
//

import SwiftUI

struct IndividualRecipie: View {
    @ObservedObject var shared = RecipieViewModel.shared
    
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
                    VStack(alignment: .leading){
                        ForEach(recipie.ingredients, id: \.name){ ingredient in
                            Text("\(ingredient.name)")
                        }
                    }
                }
                Section("Info"){
                    Stepper(value: $recipie.rating, in: 0...5){
                        Text("Rating: \(recipie.rating)/5")
                    }
                    .onChange(of: recipie.rating){
                        shared.updateRecipie(with: recipie)
                    }
                    Toggle(isOn: $recipie.isFavourite){
                        Text("Favourite")
                    }
                    .onChange(of: recipie.isFavourite) {
                        shared.updateRecipie(with: recipie)
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
