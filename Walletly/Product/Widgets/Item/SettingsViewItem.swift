//
//  SettingsViewItem.swift
//  Walletly
//
//  Created by Gokhan Kaya on 19.10.2023.
//

import SwiftUI

struct SettingsViewItem: View {
    var title:LocalizedStringKey
    var iconName: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName).foregroundStyle(Color.nude_blue)
            Text(title)
        }
    }
}

#Preview {
    SettingsViewItem(title: LocalKeys.Settings.darkMode.rawValue.locale(), iconName: "moon.fill")
}
