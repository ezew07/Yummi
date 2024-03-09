//
//  CreateRecipieView.swift
//  Yummi
//
//  Created by William Eze on 24/02/2024.
//

import SwiftUI

struct CreateRecipieView: View {
    @ObservedObject var shared = CreateRecipieViewModel.shared
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $shared.newRecipieName)
                NavigationLink(destination: IngredientsForNewRecipieView()){
                    HStack {
                        Text("Ingredients")
                        Spacer()
                        Text("\(shared.selectedRecipieIngredients.count)")
                            .foregroundStyle(shared.selectedRecipieIngredients.count == 0 ? .red : .gray)
                    }
                }
                Toggle("Favourite", isOn: $shared.newRecipieIsFavourite)
                Stepper(value: $shared.newRecipieRating, in: 0...5){
                    Text("Rating: \(shared.newRecipieRating)/5")
                }
                Stepper(value: $shared.newRecipieServings, in: 1...50){
                    Text("Servings: \(shared.newRecipieServings)")
                }
                NavigationLink(destination: InstructionsView()){
                    HStack {
                        Text("Instructions")
                        Spacer()
                        Text("\(shared.newRecipieInstructions.count)")
                            .foregroundStyle(shared.selectedRecipieIngredients.count == 0 ? .red : .gray)
                    }
                }
            }
            .navigationTitle("Create recipie")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: { shared.createNewRecipie() }) {
                        Image(systemName: "plus.square.on.square")
                    }
                    .disabled(!shared.allowedToCreateNewrecipie)
                }
            }
        }
    }
}

#Preview {
    CreateRecipieView()
}
