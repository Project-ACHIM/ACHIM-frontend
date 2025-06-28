//
//  MondayGroup.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/29.
//
import SwiftUI

struct MondayGroup: View {
    @State private var isShowingView: Bool = false
    
    var body: some View {
        if isShowingView {RankingView()} //画面遷移グループ選択へ
        else{
            VStack {
                
                
                
                
                Spacer()
                //footer
                ZStack {
                    Rectangle()
                        .fill(Color.navy)
                        .frame(height: 120)
                    
                    // 次へボタン
                    Button(action: {
                        isShowingView.toggle()
                    }) {
                        Text("次へ")
                            .zenFont(.bold, size: 18, color: .navy)
                    }
                    .frame(width: 250, height: 50)
                    .background(Color.white)
                    .cornerRadius(13)
                    .padding(.bottom, 24)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }   //else
    }   //body
}   //View

#Preview {
    MondayGroup()
}
