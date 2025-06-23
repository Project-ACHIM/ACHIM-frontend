//
//  RankingHistory.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/22.
//
import SwiftUI

struct RankingHistory: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        //戻るボタン
        VStack {
            HStack {
                Button(action:{
                    dismiss()
                }){
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.defaultBlack)
                        Text("ランキングへ")
                            .zenFont(.bold, size: 13, color: Color.defaultBlack)
                    }
                }
                .padding(.leading, 20)
                Spacer()
                    
            }
            VStack(spacing: 16) {
                RankingHistoryTitle(PageTytle: "現在のランキング")
                    
                
                RankingMyCard(userName: "マイネーム", rank: 5, sp: 500000)
            }
            .padding(.top, 20)
            
            VStack(spacing: 16) {
                RankingHistoryTitle(PageTytle: "獲得ポイントデータ")
                
            }
            .padding(.top, 20)
            Spacer()
        }
    } //
} // View

#Preview {
    RankingHistory()
}
