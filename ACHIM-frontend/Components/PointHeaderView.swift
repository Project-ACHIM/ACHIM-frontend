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
            
            HStack(alignment: .center, spacing: 16) {
                // SPブロック
                HStack(alignment: .center, spacing: 4) {
                    Image(.sp)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .offset(y: +2)
                    Text("100,000")
                        .zenFont(.bold, size: 28, color: .white)
                }
                
                Spacer()
                    .frame(width: 6)
                
                // 縦線
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 1, height: 40)
                
                Spacer()
                    .frame(width: 6)
                
                // BPブロック
                HStack(alignment: .center , spacing: 4) {
                    Image(.bp)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .offset(y: +2)
                    Text("100,000")
                        .zenFont(.bold, size: 28, color: .white)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)

            // 右端の ? ボタン
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                       
                    }) {
                        Image(systemName: "questionmark")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
                            .background(Circle().stroke(Color.white, lineWidth: 1))
                    }
                    .padding(.trailing, 8)
                    .padding(.bottom, 4)
                }
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    PointHeaderView()
}
