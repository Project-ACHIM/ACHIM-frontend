//
//  RankingHalfsheet.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/20.
//
import SwiftUI

public struct RankingHalfsheet: View {
    @State private var showModalSheet = false
    public var body: some View {
        // 履歴ボタン
        Button("履歴") {
            showModalSheet = true
        }
        .zenFont(.medium, size:12, color: Color.defaultBlack)
        .frame(width: 50, height: 25)
        .background(Color.baseSky)
        .cornerRadius(5)
        .sheet(isPresented: $showModalSheet) {
            VStack {
                ZStack{
                    // ハーフシート　ヘッダー背景
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))        // 始点移動
                        path.addLine(to: CGPoint(x: 450, y: 0))   // 直線描画
                        path.addLine(to: CGPoint(x: 450, y: 50))
                        path.addLine(to: CGPoint(x: 0, y: 50))
                    }
                    .fill(Color.hex6CB0FF)    // 塗りつぶし色指定
                    
                    // ヘッダータイトル
                    VStack {
                        Text("ランキング履歴")
                            .zenFont(.bold, size:20, color: Color.white)
                            .padding(.top, 10)
                        Spacer()
                    }
                    
                    VStack {
                        HalfsheetCard(ranking_num: 1)
                        Spacer()
                    }
                        .padding(.top, 70)
                    
                }
            }
            .presentationDetents([.height(500)])
        }
        
    }
}

#Preview {
    RankingHalfsheet()
}
