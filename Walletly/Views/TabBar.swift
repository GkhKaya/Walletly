//
//  TabBar.swift
//  Walletly
//
//  Created by Gokhan Kaya on 30.10.2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        NavigationStack{
            GeometryReader{ geometry in
                TabView{
                    Text("Home")
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                        
                    Text("Chart")
                        .tabItem {
                            Image(systemName: "chart.bar.xaxis")
                        }
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "ellipsis")
                        }
                }.tint(Color.orange)
                
            }
        }
    }
}

#Preview {
    TabBar()
}
