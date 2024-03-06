//
//  RecipieViewModel.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 01/03/2024.
//

import Foundation

class RecipieViewModel: ObservableObject {
    
    static let shared = RecipieViewModel()
    private init() {}
    
    @Published var recipies: [Recipie] = Recipie.exampleRecipies
    @Published var toggleCreateRecipie: Bool = false
    @Published var searchTextPlaceholder = ""
    var searchResults: [Recipie] {
        if searchTextPlaceholder.isEmpty {
            return recipies
        } else {
            return recipies.filter { $0.name.localizedCaseInsensitiveContains(searchTextPlaceholder) }
        }
    }
    
    func updateRecipie(with newRecipie: Recipie){
        recipies[findRecipieIndex(in: recipies, name: newRecipie.name)] = newRecipie
    }
    
    func updateIngredientQuantity(for recipie: Recipie, current old: Int, desired new: Int) {
        let conversionFactor = new/old
        var modifiedRecipie = recipie
        for i in 0 ..< recipie.ingredients.count{
            modifiedRecipie.ingredients[i].recipieQuantity *= conversionFactor
        }
        updateRecipie(with: modifiedRecipie)
    }
    
}
    
    
