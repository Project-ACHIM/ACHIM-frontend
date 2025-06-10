//
//  CountdownCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/09.
//

import SwiftUI

struct CountdownCardView: View {
    var body: some View {
        ZStack (alignment: .center){
            // 背景カード
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color("hex5D9FED").opacity(0.7), radius: 4, x: 0, y: 0)
            
            // 中央コンテンツ
            VStack(spacing: -12) {
                Text("朝活終了まで残り")
                    .zenFont(.regular, size: 12)
                
                Text("00:10:00")
                    .zenFont(.bold, size: 40, color: .navy)
            }
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 80) // ← 高さ少し広げると余白バランスよく
    }
}

#Preview {
    CountdownCardView()
}
