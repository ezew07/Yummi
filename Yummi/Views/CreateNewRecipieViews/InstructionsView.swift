//
//  InstructionsView.swift
//  Yummi
//
//  Created by William Eze on 09/03/2024.
//

import SwiftUI

struct InstructionsView: View {
    @ObservedObject var shared = CreateRecipieViewModel.shared
    
    @State private var newInstruction = ""
    
    var body: some View {
        VStack{
            List(){
                ForEach(0 ..< shared.newRecipieInstructions.count, id: \.self){index in
                    Text("\(index+1). \(shared.newRecipieInstructions[index])")
                        .swipeActions(edge: .trailing){
                            Button(role: .destructive, action: {
                                shared.deleteInstruction(index)
                            }){
                                Image(systemName: "trash")
                            }
                        }
                }
            }

            HStack() {
                TextField("Next instruciton", text: $newInstruction)
                    .padding()
                Button(action: {
                    shared.addInstruction(newInstruction)
                    newInstruction = ""
                }){
                    Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                }
                .disabled(newInstruction.isEmpty ? true : false)
                .padding()
            }
            Button(action: {
                shared.newRecipieInstructions = []
                newInstruction = ""
            }){
                Image(systemName: "trash")
                Text("Clear")
            }
            .foregroundStyle(.red)
        }
        .navigationTitle("Instructions")
    }
}

#Preview {
    InstructionsView()
}
