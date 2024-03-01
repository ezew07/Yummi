//
//  IngredientView.swift
//  Yummi
//
//  Created by William Eze on 17/02/2024.
//

import SwiftUI


struct IngredientView: View {
    @ObservedObject var shared = IngredientViewModel.shared

    var body: some View {
        NavigationStack {
            Form {
                Section("Information"){
                    VStack(alignment: .leading, spacing: 20) {
                        Text("\(shared.inventoryIngredient[shared.selectedIngredient].displayInfo)")
                        Button("Next ingredient", action: {
                            shared.selectedIngredient += 1
                        })
                    }
                }
            }
            .navigationTitle("Inventory")
            .sheet(isPresented: $shared.toggleCreateIngredient){
                CreateIngredientView()
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Button(action: {shared.toggleCreateIngredient.toggle()}){
                        Image(systemName: "plus.square.fill.on.square.fill")
                    }
                }
            }
            
            
        }

    }
}

#Preview {
    IngredientView()
}
