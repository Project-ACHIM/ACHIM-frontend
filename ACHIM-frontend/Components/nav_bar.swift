//
//  nav_bar.swift
//  ACHIM-frontend
//
//  Created by Ukezeki Karen on 2025/06/09.
//
import SwiftUI

struct nav_bar: View {
    var body: some View {
        ZStack {
            Color.navy.ignoresSafeArea()
            Rectangle()
                .fill(Color.navy)
                .frame(width: 450, height: 95)
            HStack(alignment: .center, spacing: 35) {
                //ギフト画面
                Button(action: {
                    
                }) {
                    Image(.gift)
                }
                //ランキング画面
                Button(action: {
                    
                }) {
                    Image(.ranking)
                }
                //ホーム画面
                Button(action: {
//                    HomeView()
                }) {
                    Image(.house)
                }
                //ヘルス画面
                Button(action: {
                    
                }) {
                    Image(.heartbeat)
                }
                //アカウント設定画面
                Button(action: {
                    
                }) {
                    Image(.userCircleGear)
                }
            }
        }
    }
}

#Preview {
    nav_bar()
}
