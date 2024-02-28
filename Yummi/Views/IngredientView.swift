//
//  IngredientView.swift
//  Yummi
//
//  Created by William Eze on 17/02/2024.
//

import SwiftUI


struct IngredientView: View {
    @EnvironmentObject var state: StateController
    @State private var selectedIngredient = 0 {
        didSet{
            if selectedIngredient > state.inventoryIngredient.count - 1{
                selectedIngredient = 0
            }
        }
    }
    @State private var newInventoryIngredientName = ""
    @State private var newInventoryIngredientQuantity = Int()
    @State private var newInventoryIngredientUnit = String()
    @State private var newInventoryIngredientCategory: Category  = .defaultCategory
    @State private var newInventoryIngredientExpiryDate = Date()
    @State private var intCheck = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Information"){
                    VStack(alignment: .leading, spacing: 20) {
                        Text("\(state.inventoryIngredient[selectedIngredient].displayInfo)")
                        Button("Next ingredient", action: {
                            selectedIngredient += 1
                        })
                    }
                }
                Section("Create a new ingredient"){
                    Section{
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
                        Button(action: {
                            state.inventoryIngredient.append(InventoryIngredient(ingredient: Ingredient(name: newInventoryIngredientName, quantity: newInventoryIngredientQuantity, unit: newInventoryIngredientUnit, category: newInventoryIngredientCategory), expiryDate: newInventoryIngredientExpiryDate))
                        }) {
                            Label("Make Ingredient", systemImage: "plus.square.on.square")
                        }
                    }
                }
            }
            .navigationTitle("Inventory")
        }
    }
}

#Preview {
    IngredientView()
        .environmentObject(StateController())
}
