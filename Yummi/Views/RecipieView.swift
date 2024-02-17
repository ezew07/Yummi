//
//  RecipieView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 07/02/2024.
//

import SwiftUI

struct RecipieView: View {
    
    var body: some View {
        Section("Recipies"){
            List{
                ForEach(Recipie.exampleRecipies, id: \.name) {recipies in
                    Text(recipies.displayInfo)
                }
            }
        }
    }
}

#Preview {
    RecipieView()
}
