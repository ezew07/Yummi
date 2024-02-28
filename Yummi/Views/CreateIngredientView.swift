//
//  CreateIngredientView.swift
//  Yummi
//
//  Created by William Eze on 28/02/2024.
//

import SwiftUI

struct CreateIngredientView: View {
    @EnvironmentObject var state: StateController
    @State private var newInventoryIngredientName = ""
    @State private var newInventoryIngredientQuantity = Int()
    @State private var newInventoryIngredientUnit = String()
    @State private var newInventoryIngredientCategory: Category  = .defaultCategory
    @State private var newInventoryIngredientExpiryDate = Date()
    @Binding var toggleCreateIngredient: Bool
    var body: some View {
        NavigationStack {
            Form{
                TextField("Ingredient name", text: $newInventoryIngredientName)
                HStack{
                    TextField("Quantity", value: $newInventoryIngredientQuantity, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    TextField("Unit", value: $newInventoryIngredientUnit, formatter: NumberFormatter())
                }
                Picker("Category", selection: $newInventoryIngredientCategory, content: {
                    ForEach(Category.allCases, id: \.self){ newIngredientCategory in
                        Text(newIngredientCategory.rawValue)
                        
                    }
                })
                DatePicker("Expiry Date", selection: $newInventoryIngredientExpiryDate, displayedComponents: .date)
            }
            .navigationTitle("Create ingredient")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        state.inventoryIngredient.append(InventoryIngredient(ingredient: Ingredient(name: newInventoryIngredientName, quantity: newInventoryIngredientQuantity, unit: newInventoryIngredientUnit, category: newInventoryIngredientCategory), expiryDate: newInventoryIngredientExpiryDate))
                        toggleCreateIngredient = false
                    }) {
                        Image(systemName: "plus.square.on.square")
                    }
                }
            }
        }
    }
}

#Preview {
    CreateIngredientView(toggleCreateIngredient: .constant(true))
}
