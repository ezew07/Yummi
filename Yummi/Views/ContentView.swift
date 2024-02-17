//
//  ContentView.swift
//  Yummi
//
//  Created by Eze, William (IRG) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .ingredientView
    var body: some View {
        
        selectedTab.view
        
        HStack(spacing: 80){
            Button(action:{
                selectedTab = .ingredientView
            }, label: {
                VStack{
                    Image(systemName: "fork.knife")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(selectedTab == .ingredientView ? .blue : .gray)
                    Text("Ingredients")
                        .foregroundStyle(.black)
                }
            })
            Button(action: {
                selectedTab = .recipieView
            }, label: {
                VStack{
                    Image(systemName: "book.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(selectedTab == .recipieView ? .blue : .gray)
                    Text("Recipies")
                        .foregroundStyle(.black)

                }
            })

        }
        .padding(.top, 13)
    }
}
#Preview {
    ContentView()
}
