//
//  RecipieView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 07/02/2024.
//


//                                AsyncImage(url: URL(string: recipie.imageURL)){ image in
//                                    image.resizable().frame(width: 90, height: 75, alignment: .leading)
//
//                                } placeholder: {
//                                    ProgressView()
//                                }


import SwiftUI

struct RecipieView: View {
    @ObservedObject var shared = RecipieViewModel.shared
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(shared.searchResults, id: \.name) {recipie in
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
                                Image("\(recipie.name.lowercased())")
                                    .resizable()
                                    .frame(width: 90, height: 75, alignment: .leading)
                            }
                            VStack(alignment: .leading){
                                Text("\(recipie.name)")
                                    .font(.system(size: 18))
                                Text("Serves \(recipie.servings)")
                                    .font(.system(size: 13))
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                    .swipeActions(edge: .trailing){
                        Button(role: .destructive, action: {}){
                            Image(systemName: "trash")
                        }
                    }
                    .swipeActions(edge: .leading){
                        Button(action: {shared.recipies[findRecipieIndex(in: shared.recipies, name: recipie.name)].isFavourite.toggle()
                        }){
                            Image(systemName: "heart")
                        }
                        .tint(recipie.isFavourite ? .gray : .pink)
                    
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
            .searchable(text: $shared.searchTextPlaceholder, isPresented: .constant(true))
            .autocorrectionDisabled()
        }
    }
}

#Preview {
    RecipieView()
}
