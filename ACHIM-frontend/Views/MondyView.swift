//
//  MondyView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/27.
//
import SwiftUI

struct MondayView: View {
    @State private var isShowingView: Bool = false
    
    var body: some View {
        if isShowingView {MondayGroup(bp: 50000)} //画面遷移グループ選択へ
        else{
            ZStack {
                // 背景パターン
                Image(.bgPattern)
                    .padding(.bottom, 150)
                
                // お疲れテキスト
                VStack {
                    VStack{
                        Text("お疲れ様でした！")
                            .zenFont(.bold, size: 16, color: .defaultBlack)
                        Text("一週間の成果")
                            .zenFont(.bold, size: 30, color: .navy)
                        Text("2025年6月22日 ~ 2025年6月29日")
                            .zenFont(.regular, size: 14, color: .defaultBlack)
                    }
                    .padding(.top, 40)
   
                    Spacer()
                    
                    VStack(spacing: -4) {
                        RankingMyCard(userName: "マイネーム", rank: 5, sp: 50000)
                            .scaleEffect(0.85)   // 拡大率の指定
                        //順位一覧
                        ZStack{
                            // 背景
                            Rectangle()
                                .fill(Color.baseSky)
                                .frame(width: 300, height: 400)
                                .cornerRadius(10)
                            // 順位結果
                            RankingRival()
                                .scaleEffect(0.8)   // 拡大率の指定
                        }   // ZStack
                    }   // VStack
                    
                    // footer
                    ZStack {
                        // footer背景
                        Rectangle()
                            .fill(Color.navy)
                            .frame(height: 120)
                        // 次へボタン
                        Button(action: {
                            isShowingView.toggle()
                        }) {
                            Text("次へ")
                                .zenFont(.bold, size: 18, color: .navy)
                        }
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(13)
                        .padding(.bottom, 24)
                    }   //ZStack
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }   //else
    }   //body
}   //View

#Preview {
    MondayView()
}
