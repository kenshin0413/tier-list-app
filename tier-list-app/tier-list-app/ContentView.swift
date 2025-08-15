//
//  ContentView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/09.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
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
    let tiers: [String] = ["S", "A", "B", "C", "D"]
    @State private var tierImages: [String: [UIImage]] = [
        "S": [], "A": [], "B": [], "C": [], "D": []
    ]
    @State private var activeTier: String? = nil
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(tiers, id: \.self) { tier in
                    HStack {
                        Text(tier)
                            .font(.title)
                            .frame(width: 65, height: 65)
                            .background(colorForTier(tier))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(tierImages[tier] ?? [], id: \.self) { img in
                                    Image(uiImage: img)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipped()
                                        .cornerRadius(6)
                                }
                            }
                        }
                        Spacer()
                        
                        NavigationLink {
                            if let tier = activeTier {
                                InputView { img in
                                    tierImages[tier, default: []].append(img)
                                }
                            } else {
                                Text("エラー")
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundStyle(Color.white)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            activeTier = tier
                        })
                    }
                }
                
                HStack(spacing: 65) {
                    Button {
                        
                    } label: {
                        Label {
                            Text("削除")
                        } icon: {
                            Image(systemName: "minus.circle")
                        }
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .frame(width: 150, height: 40)
                        .background(.red)
                        .cornerRadius(8)
                    }
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("追加")
                        } icon: {
                            Image(systemName: "plus.circle")
                        }
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .frame(width: 150, height: 40)
                        .background(.green)
                        .cornerRadius(8)
                    }
                }
                .padding(.top, 20)
                
                Button {
                    
                } label: {
                    Label {
                        Text("保存")
                    } icon: {
                        Image(systemName: "arrow.down.to.line")
                    }
                    .font(.title2)
                    .foregroundStyle(Color.white)
                    .frame(width: 150, height: 40)
                    .background(.blue)
                    .cornerRadius(8)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.85))
            .navigationTitle("Tier作成")
            .toolbarTitleDisplayMode(.inline)
        }
    }
    
    private func colorForTier(_ tier: String) -> Color {
        switch tier {
        case "S": return Color(red: 1.0, green: 0.4, blue: 0.4)
        case "A": return .orange
        case "B": return Color(red: 1.0, green: 0.75, blue: 0.5)
        case "C": return Color(red: 1.0, green: 0.85, blue: 0.0)
        case "D": return Color(red: 0.4, green: 0.8, blue: 0.4)
        default: return .gray
        }
    }
}

#Preview {
    ContentView()
}
