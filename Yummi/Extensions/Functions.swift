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
