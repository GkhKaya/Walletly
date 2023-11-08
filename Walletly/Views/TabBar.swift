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
                            Text(LocalKeys.TabView.home.rawValue.locale())
                        }
                        
                    Text("Chart")
                        .tabItem {
                            Image(systemName: "chart.bar.xaxis")
                            Text(LocalKeys.TabView.statistics.rawValue.locale())
                        }
                    
                    SettingsView()
                        .tabItem {
                            Image(systemName: "ellipsis")
                            Text(LocalKeys.TabView.more.rawValue.locale())
                        }
                }.tint(Color.orange)
                
            }
        }
    }
}

#Preview {
    TabBar()
}
