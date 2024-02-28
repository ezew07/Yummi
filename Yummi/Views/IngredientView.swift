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
    @State var toggleCreateIngredient: Bool = false
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
            }
            .navigationTitle("Inventory")
            .sheet(isPresented: $toggleCreateIngredient){
                CreateIngredientView(toggleCreateIngredient: $toggleCreateIngredient)
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Button(action: {toggleCreateIngredient.toggle()}){
                        Image(systemName: "plus.square.fill.on.square.fill")
                    }
                }
            }
            
            
        }

    }
}

#Preview {
    IngredientView()
        .environmentObject(StateController())
}
