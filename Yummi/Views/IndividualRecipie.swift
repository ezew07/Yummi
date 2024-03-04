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
                    Image(recipie.name.lowercased())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Section("Info"){
                    Stepper(value: $recipie.rating, in: 0...5){
                        Text("Rating: \(recipie.rating)/5")
                    }
                    .onChange(of: recipie.rating){
                        shared.updateRecipie(with: recipie)
                    }
                    Stepper(value: $recipie.servings){
                        Text("Servings: \(recipie.servings)")
                    }
                    .onChange(of: recipie.servings){
                        shared.updateRecipie(with: recipie)
                    }
                    Toggle(isOn: $recipie.isFavourite){
                        Text("Favourite")
                    }
                    .onChange(of: recipie.isFavourite) {
                        shared.updateRecipie(with: recipie)
                    }
                }
                Section("Ingredients"){
                    VStack(alignment: .leading){
                        ForEach(recipie.ingredients, id: \.name){ ingredient in
                            Text("\(ingredient.name)")
                        }
                    }
                }
                Section("Instructions"){
                    VStack(alignment: .leading){
                        ForEach(0..<recipie.steps.count, id: \.self){ step in
                            Text("\(step+1). \(recipie.steps[step])")
                        }
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
