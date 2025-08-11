//
//  HomeView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/09.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Int = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ListView()
            }
            .tabItem {
                Label("一覧", systemImage: "list.clipboard")
            }
            .tag(1)
            
            NavigationStack {
                ContentView()
            }
            .tabItem {
                Label("作成", systemImage: "plus.circle")
            }
            .tag(2)
            
            NavigationStack {
                SettingView()
            }
            .tabItem {
                Label("設定", systemImage: "gearshape")
            }
        }
    }
}


#Preview {
    HomeView()
}
