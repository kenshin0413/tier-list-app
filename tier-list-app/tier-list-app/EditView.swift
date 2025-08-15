//
//  EditView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/15.
//

import SwiftUI
import PhotosUI

struct EditTierView: View {
    @Binding var savedTier: SavedTier
    @Environment(\.dismiss) var dismiss
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var currentTier: String? = nil
    @State private var selectedImage: UIImage? = nil
    var body: some View {
        VStack {
            TextField("タイトル", text: $savedTier.title)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            ScrollView {
                ForEach(savedTier.tiers, id: \.self) { tier in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(tier)
                                .foregroundColor(.white)
                            Spacer()
                            PhotosPicker("＋画像", selection: $selectedItem, matching: .images)
                                .onChange(of: selectedItem) { newItem in
                                    loadImage(from: newItem, for: tier)
                                }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(savedTier.tierImages[tier] ?? []) { img in
                                    Image(uiImage: img.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 55, height: 55)
                                        .clipped()
                                        .cornerRadius(6)
                                        .onLongPressGesture {
                                            if let index = savedTier.tierImages[tier]?.firstIndex(where: { $0.id == img.id }) {
                                                savedTier.tierImages[tier]?.remove(at: index)
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .padding(.vertical, 5)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .onTapGesture {
                        currentTier = tier
                    }
                }
            }
            
            Button("完了") {
                dismiss()
            }
            .foregroundColor(.white)
            .frame(width: 150, height: 40)
            .background(.blue)
            .cornerRadius(8)
            .padding()
        }
        .background(Color.black.opacity(0.85))
        .navigationTitle("編集")
    }
    
    private func loadImage(from item: PhotosPickerItem?, for tier: String) {
        Task {
            guard let item else { return }
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                savedTier.tierImages[tier, default: []].append(TierImage(image: uiImage))
            }
        }
    }
}

#Preview {
    let sampleTier = SavedTier(title: "サンプル", tiers: ["S", "A", "B"], tierImages: ["S": [], "A": [], "B": []])
    EditTierView(savedTier: .constant(sampleTier))
}


