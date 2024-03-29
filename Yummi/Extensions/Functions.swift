//
//  Functions.swift
//  Yummi
//
//  Created by William Eze on 23/02/2024.
//

import Foundation

func findRecipieIndex(in data: [Recipie], name target: String) -> Int{
    for index in 0...(data.count-1){
        if data[index].name == target{
            return index
        }
    }
    return 0
}

func findRecipieIngredientIndex(in data: [RecipieIngredient], name target: String) -> Int{
    for index in 0...(data.count-1){
        if data[index].ingredient.name == target{
            return index
        }
    }
    return 0
}

func findInventoryIngredientIndex(in data: [InventoryIngredient], name target: String) -> Int{
    for index in 0...(data.count-1){
        if data[index].ingredient.name == target{
            return index
        }
    }
    return 0
}

func findInstructionIndex(in data: [String], target: String) -> Int{
    for index in 0...(data.count-1){
        if data[index] == target{
            return index
        }
    }
    return 0
}


func getDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date{
    return Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: year, month: month, day: day, hour: hour, minute: minute))!
}

func round(_ number: Float, places decimalPlaces: Int) -> Float {
    let multiplier = pow(10.0, Float(decimalPlaces))
    return round(number * multiplier) / multiplier
}



func getFilePath(filename: String) -> URL{
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
}


func loadFromFile<T: Codable>(filename: String, object: T) -> [T] {
    if let loaded: [T] = FileManager.default.load(filename: filename){
        return loaded
    }
    return []
}

func saveToFile<T: Codable>(filename: String, object: T) {
    FileManager.default.save(filename: "\(filename).json", object: object)
}
