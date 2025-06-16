//
//  PointHeaderView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/16.
//

import SwiftUI

struct PointHeaderView: View {
    var body: some View {
        ZStack {
            Color("hex6CB0FF")
            
            HStack {
                // 左側の SP
                Text("SP")
                    .zenFont(.medium, size: 14, color: .white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                // 中央の縦線
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 1, height: 24)
                
                // 右側の BP
                Text("BP")
                    .zenFont(.medium, size: 14, color: .white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 48) // 両端の余白調整
            
            // 右端の？ボタン
            HStack {
                Spacer()
                
                Button(action: {
                    // ヘルプアクション
                }) {
                    Image(systemName: "questionmark")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(Circle().stroke(Color.white, lineWidth: 1))
                }
                .padding(.trailing, 16)
            }
        }
        .frame(height: 40)
    }
}

#Preview {
    PointHeaderView()
}
