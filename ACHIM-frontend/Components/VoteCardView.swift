//
//  VoteCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/30.
//

import SwiftUI

struct VoteCardView: View {
    @Binding var didVote: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.baseSky)
                    .frame(width: 250, height: 350)
                
                Button(action: {
                    didVote.toggle()
                }) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(didVote ? .hex4089D3 : .hex6CB0FF)
                        .padding(10)
                }
            }
            // サブメッセージ（投票後のみ表示）
            if didVote {
                Text("18:00までは変更可能です。しばらくお待ちください")
                    .zenFont(.regular, size: 12,color: .navy)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8)
                    .frame(width: 300)
            }
            // メインメッセージ
            HStack(spacing: 0) {
                Image(systemName: "heart.fill")
                    .foregroundColor(didVote ? .hex4089D3 : .hex6CB0FF)
                    .font(.system(size: 14))
                Text(didVote ? "全員の投票待ちです" : "を押して投票しよう")
            }
            .zenFont(.medium, size: 14)
            // 共通の投票期限表示
            Text("投票期限 10:00 ~ 18:00")
                .zenFont(.regular, size: 12)
                .foregroundColor(.gray)
        }
        .frame(width: 200)
    }
}
