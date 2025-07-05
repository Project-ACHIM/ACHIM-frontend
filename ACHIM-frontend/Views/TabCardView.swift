//
//  TabCardView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/20.
//
import SwiftUI

struct TabCardView: View {
    @State private var selectedIndex = 2

    let tabIcons = ["crown", "gift", "house", "heart.text.clipboard", "person.circle"]

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 0) {
                // メイン表示
                ZStack {
                    switch selectedIndex {
                    case 0:
                        RankingView()
                    case 1:
                        ExchangeView()
                    case 2:
                        HomeView()
                    case 3:
                        RankingView()
                    case 4:
                        RankingView()
                    case 5:
                        RankingView()
                    default:
                        HomeView()
                    }
                }
                
                // カスタムタブバー
                HStack{
                    HStack {
                        ForEach(0..<tabIcons.count, id: \.self) { i in
                            Spacer()
                            Button(action: {
                                selectedIndex = i
                            }) {
                                VStack {
                                    Image(systemName: tabIcons[i])
                                        .font(.system(size: 23))
                                        .foregroundColor(selectedIndex == i ? .baseSky : .white) // 色切り替え
                                }
                            }
                            Spacer()
                        }
                    }
                    .frame(width: 360)
                }
                .frame(maxWidth: .infinity, maxHeight: 70)
                .padding(.top, 10)
                .padding(.bottom, 20)
                .background(Color.navy.shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }   //body
}   //View

#Preview {
    TabCardView()
}
