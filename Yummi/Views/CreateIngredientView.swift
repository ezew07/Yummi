//
//  CreateIngredientView.swift
//  Yummi
//
//  Created by William Eze on 28/02/2024.
//

import SwiftUI

struct CreateIngredientView: View {
    @ObservedObject var shared = CreateIngredientViewModel.shared
    
    var body: some View {
        NavigationStack {
            Form{
                TextField("Ingredient name", text: $shared.newInventoryIngredientName)
                HStack{
                    TextField("Quantity", value: $shared.newInventoryIngredientQuantity, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    Picker("Unit", selection: $shared.newInventoryIngredientUnit, content: {
                        ForEach(Unit.allCases, id: \.self){ newIngredientUnit in
                            Text(newIngredientUnit.rawValue)
                        }
                    })
                }
                Picker("Category", selection: $shared.newInventoryIngredientCategory, content: {
                    ForEach(Category.allCases, id: \.self){ newIngredientCategory in
                        Text(newIngredientCategory.rawValue)
                    }
                })
                DatePicker("Expiry Date", selection: $shared.newInventoryIngredientExpiryDate, displayedComponents: .date)
            }
            .navigationTitle("Create ingredient")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        shared.createInventoryIngredient()
                    }) {
                        Image(systemName: "plus.square.on.square")
                    }
                    .disabled(!shared.allowedToCreateNewIngredient)
                }
            }
        }
    }
}

#Preview {
    CreateIngredientView()
}
