//
//  RecipieView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 07/02/2024.
//



import SwiftUI

struct RecipieView: View {
    @ObservedObject var shared = RecipieViewModel.shared
    
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(shared.recipies, id: \.name) {recipies in
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
                .onDelete(perform: { indexSet in
                    shared.recipies.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Recipes")
            .toolbar{
                ToolbarItem(placement: .principal){
                    Button(action: {shared.toggleCreateRecipie.toggle()}){
                        Image(systemName: "plus.square.fill.on.square.fill")
                    }
                }
            }
            .sheet(isPresented: $shared.toggleCreateRecipie) {
                CreateRecipieView()
            }
            
        }
    }
}

#Preview {
    RecipieView()
}
