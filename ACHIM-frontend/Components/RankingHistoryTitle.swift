//
//  RankingHistoryTitle.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/23.
//
import SwiftUI

struct RankingHistoryTitle: View {
    @State var PageTytle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(PageTytle)
                .zenFont(.bold, size: 20, color: Color.navy)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 2)
                .foregroundStyle(Color.hexACD3FF)
        } //Vstack
    } //body
}  //View

#Preview {
    RankingHistoryTitle(PageTytle: String())
}
