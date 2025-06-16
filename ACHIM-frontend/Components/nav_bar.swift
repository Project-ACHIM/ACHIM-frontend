//
//  nav_bar.swift
//  ACHIM-frontend
//
//  Created by Ukezeki Karen on 2025/06/09.
//
import SwiftUI

struct nav_bar: View {
    var body: some View {
        //画面サイズ取得
        GeometryReader{ GeometryReader  in
            let view_maxX = GeometryReader.frame(in: .local).maxX   //画面サイズ横
            ZStack {
                Rectangle()
                    .fill(Color.navy)
                    .frame(width: view_maxX, height: 95)
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
                        #Preview{ HomeView()}
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
}

#Preview {
    nav_bar()
}
