//
//  RecipieView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 07/02/2024.
//



import SwiftUI

struct RecipieView: View {
    @EnvironmentObject var state: StateController
    var body: some View {
        NavigationStack{
            List{
                ForEach(state.recipies, id: \.name) {recipies in
                    NavigationLink(destination: IndividualRecipie(recipie: recipies)) {
                        if recipies.isFavourite{
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        }
                        else{
                            Image(systemName: "star")
                        }
                        Text("\(recipies.name)")
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipieView()
        .environmentObject(StateController())
}
