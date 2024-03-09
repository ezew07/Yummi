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
                    Text("Ingredients")
                }
                Toggle("Favourite", isOn: $shared.newRecipieIsFavourite)
                Stepper(value: $shared.newRecipieRating, in: 0...5){
                    Text("Rating: \(shared.newRecipieRating)/5")
                }
                Stepper(value: $shared.newRecipieServings, in: 1...50){
                    Text("Servings: \(shared.newRecipieServings)")
                }
                NavigationLink(destination: InstructionsView()){
                    Text("Instructions")
                }
            }
            .navigationTitle("Create recipie")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: { shared.createNewRecipie() }) {
                        Image(systemName: "plus.square.on.square")
                    }
                    .disabled(shared.allowedToCreateNewrecipie)
                }
            }
        }
    }
}

#Preview {
    CreateRecipieView()
}
