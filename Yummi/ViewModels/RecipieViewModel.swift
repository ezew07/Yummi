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
    
    func returnRecipieWithUpdatedQuantity(in currentRecipie: Recipie, newValue: Int, oldValue: Int) -> Recipie {
        var modifiedRecipie = currentRecipie
        for i in 0..<modifiedRecipie.ingredients.count{
            modifiedRecipie.ingredients[i].recipieQuantity *= Float(newValue)/Float(oldValue)
        }
        return modifiedRecipie
    }
}
    
    
