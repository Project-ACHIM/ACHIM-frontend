//
//  ExchangeView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/20.
//

import SwiftUI

struct ExchangeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // 固定表示部分
            BPPointDisplay(points: 500_000)
                .padding(.bottom, 20)
            
            // スクロール部分
            ScrollView {
                VStack(spacing: 10) {
                    GiftCardView()
                    GiftCardView()
                    GiftCardView()
                    GiftCardView()
                }
//                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    ExchangeView()
}
