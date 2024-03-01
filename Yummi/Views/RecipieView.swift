//
//  RecipieView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 07/02/2024.
//



import SwiftUI

struct RecipieView: View {
    @EnvironmentObject var state: StateController
    @ObservedObject var shared = RecipieViewModel.shared
    
    
    @State var toggleCreateRecipie: Bool = false
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
                .onDelete(perform: { indexSet in
                    state.recipies.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Recipes")
            .toolbar{
                ToolbarItem(placement: .principal){
                    Button(action: {toggleCreateRecipie.toggle()}){
                        Image(systemName: "plus.square.fill.on.square.fill")
                    }
                }
            }
            .sheet(isPresented: $toggleCreateRecipie) {
                CreateRecipieView()
            }
            
        }
    }
}

#Preview {
    RecipieView()
        .environmentObject(StateController())
}
