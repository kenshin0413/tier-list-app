//
//  TierCreateView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/09.
//

import SwiftUI
import PhotosUI

struct TierImage: Identifiable, Hashable {
    let id = UUID()
    let image: UIImage
    
    static func == (lhs: TierImage, rhs: TierImage) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct SavedTier: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var tiers: [String]
    var tierImages: [String: [TierImage]]
    
    static func == (lhs: SavedTier, rhs: SavedTier) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct TierCreateView: View {
    @State var tiers: [String] = ["S", "A", "B", "C", "D"]
    @State private var tierImages: [String: [TierImage]] = [
        "S": [], "A": [], "B": [], "C": [], "D": []
    ]
    private let allTiers = ["S", "A", "B", "C", "D", "E", "F", "G"]
    @State var title = "タイトル"
    @Binding var savedTiers: [SavedTier]
    @State private var goToList = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                NavigationLink {
                    TitleView(title: $title)
                } label: {
                    HStack {
                        Text(title)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: 370, height: 50)
                    .background(Color.gray)
                    .cornerRadius(8)
                }
                ForEach(tiers, id: \.self) { tier in
                    HStack {
                        Text(tier)
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(colorForTier(tier))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(tierImages[tier] ?? []) { tierImage in
                                    Image(uiImage: tierImage.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 55, height: 55)
                                        .clipped()
                                        .cornerRadius(6)
                                }
                            }
                        }
                        Spacer()
                        
                        NavigationLink {
                            PhotoView { img in
                                tierImages[tier, default: []].append(TierImage(image: img))
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundStyle(Color.white)
                        }
                    }
                }
                
                HStack(spacing: 65) {
                    Button {
                        if let last = tiers.last, last != "S" {
                            tiers.removeLast()
                            tierImages[last] = nil
                        }
                    } label: {
                        Label("削除", systemImage: "minus.circle")
                            .font(.title2)
                            .foregroundStyle(Color.white)
                            .frame(width: 150, height: 40)
                            .background(.red)
                            .cornerRadius(8)
                    }
                    
                    Button {
                        //allTiers の中から、tiers にまだ含まれていない最初の要素を返す
                        //tiersは現在表示されてるtierのこと
                        if let nextTier = allTiers.first(where: { !tiers.contains($0) }) {
                            tiers.append(nextTier)
                            tierImages[nextTier] = []
                        }
                    } label: {
                        Label("追加", systemImage: "plus.circle")
                            .font(.title2)
                            .foregroundStyle(Color.white)
                            .frame(width: 150, height: 40)
                            .background(.green)
                            .cornerRadius(8)
                    }
                }
                .padding(.top, 20)
                
                Button {
                    let newTier = SavedTier(title: title, tiers: tiers, tierImages: tierImages)
                    savedTiers.append(newTier)
                    goToList = true
                } label: {
                    Label("保存", systemImage: "")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .frame(width: 150, height: 40)
                        .background(.blue)
                        .cornerRadius(8)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.black.opacity(0.85))
            .navigationTitle("Tier作成")
            .toolbarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $goToList) {
                ListView(savedTiers: $savedTiers)
            }
        }
    }
    
    private func colorForTier(_ tier: String) -> Color {
        switch tier {
        case "S": return Color(red: 1.0, green: 0.4, blue: 0.4)
        case "A": return .orange
        case "B": return Color(red: 1.0, green: 0.75, blue: 0.5)
        case "C": return Color(red: 1.0, green: 0.85, blue: 0.0)
        case "D": return Color(red: 0.4, green: 0.8, blue: 0.4)
        case "E": return .blue
        case "F": return .purple
        case "G": return .pink
        default: return .gray
        }
    }
}

#Preview {
    TierCreateView(savedTiers: .constant([]))
}



