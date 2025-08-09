import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/kenshin/Desktop/tier-list-app/tier-list-app/tier-list-app/ContentView.swift", line: 1)
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
            VStack(alignment: .leading, spacing: __designTimeInteger("#33091_0", fallback: 10)) {
                HStack {
                    Text(__designTimeString("#33091_1", fallback: "S"))
                        .font(.title)
                        .frame(width: __designTimeInteger("#33091_2", fallback: 65), height: __designTimeInteger("#33091_3", fallback: 65))
                        .background(Color(red: __designTimeFloat("#33091_4", fallback: 1.0), green: __designTimeFloat("#33091_5", fallback: 0.4), blue: __designTimeFloat("#33091_6", fallback: 0.4)))
                        .cornerRadius(__designTimeInteger("#33091_7", fallback: 8))
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: __designTimeString("#33091_8", fallback: "plus.circle.fill"))
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack {
                    Text(__designTimeString("#33091_9", fallback: "A"))
                        .font(.title)
                        .frame(width: __designTimeInteger("#33091_10", fallback: 65), height: __designTimeInteger("#33091_11", fallback: 65))
                        .background(.orange)
                        .cornerRadius(__designTimeInteger("#33091_12", fallback: 8))
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: __designTimeString("#33091_13", fallback: "plus.circle.fill"))
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack {
                    Text(__designTimeString("#33091_14", fallback: "B"))
                        .font(.title)
                        .frame(width: __designTimeInteger("#33091_15", fallback: 65), height: __designTimeInteger("#33091_16", fallback: 65))
                        .background(Color(red: __designTimeFloat("#33091_17", fallback: 1.0), green: __designTimeFloat("#33091_18", fallback: 0.75), blue: __designTimeFloat("#33091_19", fallback: 0.5)))
                        .cornerRadius(__designTimeInteger("#33091_20", fallback: 8))
                    NavigationLink {
                       
                    } label: {
                        Image(systemName: __designTimeString("#33091_21", fallback: "plus.circle.fill"))
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack {
                    Text(__designTimeString("#33091_22", fallback: "C"))
                        .font(.title)
                        .frame(width: __designTimeInteger("#33091_23", fallback: 65), height: __designTimeInteger("#33091_24", fallback: 65))
                        .background(Color(red: __designTimeFloat("#33091_25", fallback: 1.0), green: __designTimeFloat("#33091_26", fallback: 0.85), blue: __designTimeFloat("#33091_27", fallback: 0.0)))
                        .cornerRadius(__designTimeInteger("#33091_28", fallback: 8))
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: __designTimeString("#33091_29", fallback: "plus.circle.fill"))
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack {
                    Text(__designTimeString("#33091_30", fallback: "D"))
                        .font(.title)
                        .frame(width: __designTimeInteger("#33091_31", fallback: 65), height: __designTimeInteger("#33091_32", fallback: 65))
                        .background(Color(red: __designTimeFloat("#33091_33", fallback: 0.4), green: __designTimeFloat("#33091_34", fallback: 0.8), blue: __designTimeFloat("#33091_35", fallback: 0.4)))
                        .cornerRadius(__designTimeInteger("#33091_36", fallback: 8))
                    NavigationLink {
            
                    } label: {
                        Image(systemName: __designTimeString("#33091_37", fallback: "plus.circle.fill"))
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                HStack(spacing: __designTimeInteger("#33091_38", fallback: 65)) {
                    Button {
                        
                    } label: {
                        Label {
                            Text(__designTimeString("#33091_39", fallback: "削除"))
                        } icon: {
                            Image(systemName: __designTimeString("#33091_40", fallback: "minus.circle"))
                        }
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .frame(width: __designTimeInteger("#33091_41", fallback: 150), height: __designTimeInteger("#33091_42", fallback: 40))
                        .background(.red)
                        .cornerRadius(__designTimeInteger("#33091_43", fallback: 8))
                    }
                    .padding(.top, __designTimeInteger("#33091_44", fallback: 20))
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text(__designTimeString("#33091_45", fallback: "追加"))
                        } icon: {
                            Image(systemName: __designTimeString("#33091_46", fallback: "plus.circle"))
                        }
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .frame(width: __designTimeInteger("#33091_47", fallback: 150), height: __designTimeInteger("#33091_48", fallback: 40))
                        .background(.green)
                        .cornerRadius(__designTimeInteger("#33091_49", fallback: 8))
                    }
                    .padding(.top, __designTimeInteger("#33091_50", fallback: 20))
                }
                
                Button {
                    
                } label: {
                    Label {
                        Text(__designTimeString("#33091_51", fallback: "保存"))
                    } icon: {
                        Image(systemName: __designTimeString("#33091_52", fallback: "arrow.down.to.line"))
                    }
                    .font(.title2)
                    .foregroundStyle(Color.white)
                    .frame(width: __designTimeInteger("#33091_53", fallback: 150), height: __designTimeInteger("#33091_54", fallback: 40))
                    .background(.blue)
                    .cornerRadius(__designTimeInteger("#33091_55", fallback: 8))
                }
                .padding(.leading,__designTimeInteger("#33091_56", fallback: 110))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(red: __designTimeInteger("#33091_57", fallback: 0), green: __designTimeInteger("#33091_58", fallback: 0), blue: __designTimeInteger("#33091_59", fallback: 0), opacity: __designTimeFloat("#33091_60", fallback: 0.85)))
            .navigationTitle(__designTimeString("#33091_61", fallback: "Tier表"))
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
