//
//  TitleView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/13.
//

import SwiftUI

struct TitleView: View {
    init(title: Binding<String>) {
        self._title = title
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    @Binding var title: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    VStack {
                        Text("▫️タイトル")
                            .foregroundStyle(Color.white)
                            .padding(.top, 10)
                        
                        TextField("タイトルを入力", text: $title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                    .frame(width: 330, height: 100)
                    .background(Color.gray)
                    .cornerRadius(8)
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("設定")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 10)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding(.bottom, 200)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.85))
            .navigationTitle("タイトル入力")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TitleView(title: .constant(""))
}


