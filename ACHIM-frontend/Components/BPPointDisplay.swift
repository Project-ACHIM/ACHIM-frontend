//
//  BPPointDisplay.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/23.
//

import SwiftUI

struct BPPointDisplay: View {
    let points: Int
    
    var body: some View {
        HStack(alignment: .center,spacing: 12) {
            // BPバッジ
            Image(.bp)
                .resizable()
                .frame(width: 50, height: 50)
                .alignmentGuide(.firstTextBaseline) { d in d[VerticalAlignment.center] + -10 }
            
            HStack(alignment: .firstTextBaseline) {
                // 数値
                Text("\(points.formatted())")
                    .zenFont(.bold, size: 40, color: .defaultBlack)
                
                // 単位
                Text("pt")
                    .zenFont(.bold, size: 30, color: .defaultBlack)
            }
        }
        .frame(width: 350,height: 100)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.hex5D9FED.opacity(0.7), radius: 4, x: 0, y: 0)
        )
    }
}

#Preview {
    BPPointDisplay(points: 500_000)
}
