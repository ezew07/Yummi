//
//  IngredientView.swift
//  Yummi
//
//  Created by William Eze on 17/02/2024.
//

import SwiftUI


//VStack(alignment: .leading, spacing: 20) {
//    Text("\(shared.inventoryIngredient[shared.selectedIngredient].displayInfo)")
//    Button("Next ingredient", action: {
//        shared.selectedIngredient += 1
//    })
//}


struct IngredientView: View {
    @ObservedObject var shared = IngredientViewModel.shared
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(shared.inventoryIngredient, id: \.ingredient.name) {ingredient in
                    VStack(alignment: .leading) {
                        HStack(alignment: .center){
                            Text(ingredient.ingredient.name)
                                .font(.system(size: 23))
                            Text("")
                            Text(ingredient.ingredient.category.rawValue)
                                .foregroundStyle(.gray)
                        }
                        HStack{
                            Text("\(ingredient.ingredient.quantity) \(ingredient.ingredient.unit)")
                            Text("•")
                            Text(ingredient.expiryDate.formatted(date: .abbreviated, time: .omitted))
                                .foregroundStyle(Color(red: 0.9412, green: 0.4902, blue: 0.4745))
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    shared.inventoryIngredient.remove(atOffsets: indexSet)
                })
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
