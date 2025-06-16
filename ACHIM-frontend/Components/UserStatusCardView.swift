//
//  UserStatusCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/13.
//

import SwiftUI

struct UserStatusCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.baseSky)
            
            HStack(alignment: .center) {
                // 左側：タイトル
                HStack {
                    Text("自分の参加状況")
                        .zenFont(.medium, size: 20, color: .navy)
                    
                    Text("－")
                        .zenFont(.regular, size: 20, color: .navy)
                }
                .frame(width: 180, alignment: .leading)
                
                Spacer()
                Spacer()
                Spacer()
                
                // 右側：ライバルリスト
                VStack(alignment: .leading, spacing: 8) {
                    rivalRow(name: "ライバル１", symbol: "◯")
                    rivalRow(name: "ライバル２", symbol: "－")
                    rivalRow(name: "ライバル３", symbol: "△")
                    rivalRow(name: "ライバル４", symbol: "◯")
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 14)
        }
        .frame(width: 350, height: 130)
    }
    
    // ライバル行コンポーネント
    func rivalRow(name: String, symbol: String) -> some View {
        HStack {
            Text(name)
                .zenFont(.regular, size: 12, color: .navy) // ← 12px相当
            
            Spacer()
            
            Text(symbol)
                .zenFont(.regular, size: 10, color: .navy) // ← 10px相当
                .frame(width: 20, height: 20)
                .background(Circle().fill(Color.white))
        }
    }
}

#Preview {
    UserStatusCardView()
}
