//
//  RecipieView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 07/02/2024.
//


//.onDelete(perform: { indexSet in
//    shared.recipies.remove(atOffsets: indexSet)
//})

//                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
//                        Button(action:{
//                            shared.recipies[findRecipieIndex(in: shared.recipies, name: recipie.name)].isFavourite.toggle()
//                            shared.updateRecipie(with: recipie)
//                        }){
//                            Image(systemName: "heart")
//                        }
//                    }

import SwiftUI

struct RecipieView: View {
    @ObservedObject var shared = RecipieViewModel.shared
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(shared.recipies, id: \.name) {recipie in
                    NavigationLink(destination: IndividualRecipie(recipie: recipie)) {
                        HStack{
                            if recipie.isFavourite{
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(.red)
                            }
                            else{
                                Image(systemName: "heart")
                            }
                            
                            HStack{
                                AsyncImage(url: URL(string: recipie.imageURL)){ image in
                                    image.resizable().frame(width: 60, height: 50, alignment: .leading)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            VStack(alignment: .leading){
                                Text("\(recipie.name)")
                                HStack{
                                    ForEach(0..<recipie.rating, id: \.self){ _ in
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(.yellow)
                                    }
                                    ForEach(0..<5-recipie.rating, id: \.self){ _ in
                                        Image(systemName: "star")
                                    }
                                    
                                }
                            }
                        }
                    }
                    .swipeActions(edge: .leading){
                        Button(action: {shared.recipies[findRecipieIndex(in: shared.recipies, name: recipie.name)].isFavourite.toggle()
                        }){
                            Image(systemName: "heart")
                        }
                    }
                }

                .swipeActions(edge: .trailing){
                    Button(role: .destructive, action: {}){
                        Image(systemName: "trash")
                    }
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
}

#Preview {
    RecipieView()
}
