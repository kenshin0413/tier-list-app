//
//  PhotoView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/09.
//

import SwiftUI
import PhotosUI

struct PhotoView: View {
    var onImagePicked: (UIImage) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    init(onImagePicked: @escaping (UIImage) -> Void) {
        self.onImagePicked = onImagePicked
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
            VStack(spacing: 50) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(8)
                }
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        Image(systemName: "photo.badge.plus")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.white)
                    }
                    .onChange(of: selectedItem) {
                        Task {
                            if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedImage = uiImage
                            }
                        }
                    }
                
                Button {
                    if let img = selectedImage {
                        onImagePicked(img)
                        dismiss()
                    }
                } label: {
                    Text("追加")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .frame(width: 200, height: 40)
                        .background(.blue)
                        .cornerRadius(8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.85))
            .navigationTitle("アイテム追加")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PhotoView { _ in }
}
