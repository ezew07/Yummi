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
                        HStack{
                            AsyncImage(url: URL(string: recipies.imageURL)){ image in
                                image.resizable().frame(width: 60, height: 50, alignment: .leading)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            
                        }
                        
                        VStack(alignment: .leading){
                            Text("\(recipies.name)")
                            HStack{
                                ForEach(0..<recipies.rating, id: \.self){ _ in
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                    
                                }
                            }
                        }
                        if recipies.isFavourite{
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                        }
                        else{
                            Image(systemName: "heart")
                        }
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
