//
//  ContentView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/01/2024.
//

import SwiftUI

func getDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date{
    return Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: year, month: month, day: day, hour: hour, minute: minute))!
}

struct ContentView: View {
    @State private var allIngredients = AllIngredients()
    @State private var selectedIngredient = 0 {
        didSet{
            if selectedIngredient > allIngredients.ingredients.count - 1{
                selectedIngredient = 0
            }
        }
    }
    @State private var newIngredientName = ""
    @State private var newIngredientQuantity = Int()
    @State private var newIngredientUnit = Int()
    @State private var newIngredientCategory: Category
    @State private var newIngredientExpiryDate = Date()
    @State private var intCheck = 0


    var body: some View {
        Form {
            Section("Information"){
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(allIngredients.ingredients[selectedIngredient].displayInfo)")
                    Button("Next ingredient", action: {
                        selectedIngredient += 1
                    })
                }
                .padding()
            }
            Section("Create a new ingredient"){
                Section{
                    TextField("Ingredient name", text: $newIngredientName)
                    TextField("Quantity", value: $newIngredientQuantity, formatter: NumberFormatter())
                    TextField("Unit", value: $newIngredientUnit, formatter: NumberFormatter())
                    TextField("Category", value: $newIngredientCategory, formatter: for)
                    DatePicker("Expiry Date", selection: $newIngredientExpiryDate)
                    Button(action: {
                        allIngredients.ingredients.append(Ingredients(name: newIngredientName, quantity: newIngredientQuantity, unit: newIngredientUnit, category: newIngredientCategory, expiryDate: newIngredientExpiryDate))
                    }) {
                        Label("Make Ingredient", systemImage: "plus.square.on.square")
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
