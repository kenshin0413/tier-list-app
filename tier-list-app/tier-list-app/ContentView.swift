//
//  ContentView.swift
//  tier-list-app
//
//  Created by miyamotokenshin on R 7/08/09.
//

import SwiftUI

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
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("S")
                        .font(.title)
                        .frame(width: 65, height: 65)
                        .background(Color(red: 1.0, green: 0.4, blue: 0.4))
                        .cornerRadius(8)
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack {
                    Text("A")
                        .font(.title)
                        .frame(width: 65, height: 65)
                        .background(.orange)
                        .cornerRadius(8)
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack {
                    Text("B")
                        .font(.title)
                        .frame(width: 65, height: 65)
                        .background(Color(red: 1.0, green: 0.75, blue: 0.5))
                        .cornerRadius(8)
                    NavigationLink {
                       
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack {
                    Text("C")
                        .font(.title)
                        .frame(width: 65, height: 65)
                        .background(Color(red: 1.0, green: 0.85, blue: 0.0))
                        .cornerRadius(8)
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack {
                    Text("D")
                        .font(.title)
                        .frame(width: 65, height: 65)
                        .background(Color(red: 0.4, green: 0.8, blue: 0.4))
                        .cornerRadius(8)
                    NavigationLink {
            
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundStyle(Color.white)
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
                    .padding(.top, 20)
                    
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
                    .padding(.top, 20)
                }
                
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
                .padding(.leading,110)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.85))
            .navigationTitle("Tier表")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
