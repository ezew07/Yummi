//
//  ContentView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            IngredientView(examples: Ingredient.examples)
                .tabItem{
                    Image(systemName: "fork.knife")
                    Text("Ingredients")
                }
            RecipieView()
                .tabItem{
                    Image(systemName: "book.fill")
                    Text("Ingredients")
                }
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(StateController())
}
