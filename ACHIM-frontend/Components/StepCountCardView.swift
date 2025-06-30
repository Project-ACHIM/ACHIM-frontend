//
//  StepCountCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/08.
//

import SwiftUI

import SwiftUI

struct StepCountCardView: View {
    let stepCount: Int
    
    var body: some View {
        GeometryReader { geo in
            let isCompact = geo.size.height <= 50
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: Color("hex5D9FED").opacity(0.7),
                            radius: 4, x: 0, y: 0)
                
                if isCompact {
                    // 🔹 50px のときの簡略レイアウト
                    HStack {
                        Text("今日の歩数")
                            .zenFont(.medium, size: 12)
                        
                        Spacer()
                        
                        Text("\(stepCount.formatted())歩")
                            .zenFont(.bold, size: 24, color: .defaultBlack)
                    }
                    .padding(.horizontal, 16)
                } else {
                    // 🔸 通常の詳細レイアウト
                    HStack {
                        VStack(alignment: .leading) {
                            Text("今日の歩数は")
                                .zenFont(.medium, size: 14)
                            
                            HStack(alignment: .firstTextBaseline, spacing: 0) {
                                Text("\(stepCount.formatted())")
                                    .zenFont(.bold, size: 32, color: .navy)
                                
                                Text("歩")
                                    .zenFont(.bold, size: 22, color: .navy)
                                
                                Text("です！")
                                    .zenFont(.bold, size: 16)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                        Image(.character)
                    }
                    .padding(19)
                    .background(Image(.numberBackground))
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .frame(maxWidth: 350) // 呼び出し側で height 指定すれば自動で切り替わる
    }
}

#Preview {
    StepCountCardView(stepCount: 15000)
        .frame(height: 180)
}
