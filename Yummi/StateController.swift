//
//  StateController.swift
//  Yummi
//
//  Created by William Eze on 23/02/2024.
//

import Foundation

class StateController: ObservableObject {
    @Published var recipies: [Recipie]
    
    init() {
        recipies = Recipie.exampleRecipies
    }
}

