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
                // お疲れテキスト
                VStack {
                    VStack{
                        Text("今週も頑張りましょう！")
                            .zenFont(.bold, size: 16, color: .defaultBlack)
                        Text("グループ選択")
                            .zenFont(.bold, size: 30, color: .navy)
                        Text("今週参加するグループを選択してください")
                            .zenFont(.regular, size: 14, color: .defaultBlack)
                    }
                }
                .padding(.top, 40)
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
