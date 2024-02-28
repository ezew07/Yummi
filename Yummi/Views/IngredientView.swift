//
//  IngredientView.swift
//  Yummi
//
//  Created by William Eze on 17/02/2024.
//

import SwiftUI

func getDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date{
    return Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: year, month: month, day: day, hour: hour, minute: minute))!
}

struct IngredientView: View {
    @State var examples: [Ingredient]
    @State private var selectedIngredient = 0 {
        didSet{
            if selectedIngredient > examples.count - 1{
                selectedIngredient = 0
            }
        }
    }
    @State private var newIngredientName = ""
    @State private var newIngredientQuantity = Int()
    @State private var newIngredientUnit = String()
    @State private var newIngredientCategory: Category  = .defaultCategory
    @State private var newIngredientExpiryDate = Date()
    @State private var intCheck = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Information"){
                    VStack(alignment: .leading, spacing: 20) {
                        Text("\(examples[selectedIngredient].displayInfo)")
                        Button("Next ingredient", action: {
                            selectedIngredient += 1
                        })
                    }
                }
                Section("Create a new ingredient"){
                    Section{
                        TextField("Ingredient name", text: $newIngredientName)
                        HStack{
                            TextField("Quantity", value: $newIngredientQuantity, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                            TextField("Unit", value: $newIngredientUnit, formatter: NumberFormatter())
                        }
                        Picker("Category", selection: $newIngredientCategory, content: {
                            ForEach(Category.allCases, id: \.self){ newIngredientCategory in
                                Text(newIngredientCategory.rawValue)
                                
                            }
                        })
                        DatePicker("Expiry Date", selection: $newIngredientExpiryDate, displayedComponents: .date)
                        Button(action: {
                            examples.append(Ingredient(name: newIngredientName, quantity: newIngredientQuantity, unit: newIngredientUnit, category: newIngredientCategory, expiryDate: newIngredientExpiryDate))
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
    IngredientView(examples: Ingredient.examples)
}
