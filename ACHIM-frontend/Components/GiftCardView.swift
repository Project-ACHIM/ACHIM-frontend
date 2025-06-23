//
//  GiftCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/20.
//

import SwiftUI

struct GiftCardView: View {
    var body: some View {
        ZStack{
            // 背景
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("hex6CB0FF"), lineWidth: 1)
                )
                .frame(width: 350,height:160)
            HStack(alignment: .bottom) {
                // 左側：テキストとボタン
                VStack(alignment: .leading,spacing: 18) {
                    VStack(alignment: .leading,spacing:-2){
                        Text("Amazon gift")
                            .zenFont(.bold, size: 18, color: .defaultBlack)
                            .foregroundColor(.black)
                        Text("ここに交換する物の説明文が入ります。ここに交換する物の説明文が入ります。ここに交換する物の説明文が入ります。ここに交換する物の説明文が入ります。")
                            .zenFont(.regular, size: 10, color: .defaultBlack)
                            .lineLimit(4)  // ← 最大4行
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    
                    Button(action: {
                        // 交換アクション
                    }) {
                        Text("10,000,000P 交換")
                            .zenFont(.bold, size: 18, color: .white)
                            .frame(width: 180, height: 30)
                            .background(Color("hex6CB0FF"))
                            .cornerRadius(10)
                    }
                }
                .frame(width: 180, height: 130)
                
                
                
                // 右側：画像の代わりに空の四角
                Image(.no)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    GiftCardView()
}
