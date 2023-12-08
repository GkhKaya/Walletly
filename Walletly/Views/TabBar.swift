//
//  TabBar.swift
//  Walletly
//
//  Created by Gokhan Kaya on 30.10.2023.
//

import SwiftUI

struct TabBar: View {
    @Binding var showMainAuthView : Bool
    var body: some View {
        NavigationStack{
            GeometryReader{ geometry in
                TabView{
                    HomeView()
                        .tabItem {
                                Image(systemName: "house.fill")
                            Text(LocalKeys.TabView.home.rawValue.locale())
                        }
                        
                    Text("Chart")
                        .tabItem {
                            Image(systemName: "chart.bar.xaxis")
                            Text(LocalKeys.TabView.statistics.rawValue.locale())
                        }
                    
                    SettingsView(showMainAuthView: $showMainAuthView)
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
    TabBar(showMainAuthView: .constant(false))
}
