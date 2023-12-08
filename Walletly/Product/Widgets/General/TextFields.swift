//
//  TextFields.swift
//  Walletly
//
//  Created by Gokhan Kaya on 4.10.2023.
//

import Foundation
import SwiftUI


struct HTextField: View {
    let hint: LocalizedStringKey
    let iconName: String
    var text : Binding<String>
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(Color.nude_blue)
            TextField(hint,text: text)
            
        }
        .padding(.all,ProjectPaddings.All.normal.rawValue)
        .background(.gray)
        .cornerRadius(ProjectRadius.normalRadius)
    }
}

struct HSecureTextField: View {
    let hint: LocalizedStringKey
    let iconName: String
    var text : Binding<String>
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.yellow)
            SecureField(hint,text: text)
            
            
        }
        .padding(.all,ProjectPaddings.All.normal.rawValue)
        .background(.gray)
        .cornerRadius(ProjectRadius.normalRadius)
    }
}
