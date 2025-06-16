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
            
            HStack(spacing: 16) {
                // SPブロック
                HStack(alignment: .bottom , spacing: 4) {
                    Image(.sp)
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("100,000")
                        .zenFont(.regular, size: 18, color: .white)
                }
                
                // 縦線
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 1, height: 24)
                
                // BPブロック
                HStack(alignment: .bottom , spacing: 4) {
                    Image(.bp)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("100,000")
                        .zenFont(.regular, size: 18, color: .white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 48)
            .frame(height: 40)
            
            // 右端の ? ボタン
            HStack {
                Spacer()
                Button(action: {
                    // アクション
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
