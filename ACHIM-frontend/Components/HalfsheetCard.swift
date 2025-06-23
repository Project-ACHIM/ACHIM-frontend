//
//  HalfsheetCard.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/22.
//
import SwiftUI
struct HalfsheetCard : View {
    @State var ranking_num : Int
    var body: some View {
        ZStack {
            // Card 背景
           Rectangle()
                .fill(Color.baseSky)
                .frame(maxWidth: 350, maxHeight: 80)
                .cornerRadius(10)
            
            VStack(alignment: .center, spacing: 8) {
                Text("第\(ranking_num)回目")
                    .zenFont(.bold, size: 14, color: Color.defaultBlack)
                Text("2025年6月22日 ~ 2025年6月29日")
                    .zenFont(.regular, size: 12, color: Color.defaultBlack)
            }
        }
    }
}

#Preview {
    HalfsheetCard(ranking_num: Int())
}
