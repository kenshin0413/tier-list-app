//
//  SettingView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/09.
//

import SwiftUI

struct SettingView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    var body: some View {
        NavigationStack {
            VStack {
                Text("axswdcsac")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.85))
            .navigationTitle("設定")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingView()
}
