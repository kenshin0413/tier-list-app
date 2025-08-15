//
//  ListView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/09.
//

import SwiftUI

struct ListView: View {
    @Binding var savedTiers: [SavedTier]
    var selectedTier: SavedTier?
    init(savedTiers: Binding<[SavedTier]>, selectedTier: SavedTier? = nil) {
        self._savedTiers = savedTiers
        self.selectedTier = selectedTier
        
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
                List {
                    ForEach(savedTiers) { tier in
                        NavigationLink(destination: EditTierView(savedTier: binding(for: tier))) {
                            Text(tier.title)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.85))
            .navigationTitle("一覧")
            .toolbarTitleDisplayMode(.inline)
            .navigationDestination(for: SavedTier.self) { tier in
                EditTierView(savedTier: binding(for: tier))
            }
        }
    }
    
    private func binding(for tier: SavedTier) -> Binding<SavedTier> {
        guard let index = savedTiers.firstIndex(where: { $0.id == tier.id }) else {
            fatalError("Tier not found")
        }
        return $savedTiers[index]
    }
}

#Preview {
    ListView(savedTiers: .constant([
        SavedTier(title: "サンプル", tiers: ["S","A"], tierImages: ["S": [], "A": []])
    ]))
}


