//
//  TabItem.swift
//  Yummi
//
//  Created by William Eze on 17/02/2024.
//

import Foundation
import SwiftUI

struct TabItem<Content: View>: View {
    var icon: String
    var label: String
    var content: Content

    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(label)
        }
        .padding()
        .foregroundColor(.primary)
        .frame(maxWidth: .infinity)
    }
}
