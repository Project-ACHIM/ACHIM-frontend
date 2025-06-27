//
//  MondyView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/27.
//
import SwiftUI

struct MondyView: View {
    @State private var isShowingView: Bool = false

       var body: some View {
           if isShowingView {RankingView()} //画面遷移グループ選択へ
           else{
               VStack {
                   Spacer()
                   ZStack {
                       Rectangle()
                           .fill(Color.navy)
                           .frame(height: 120)
                           

                       Button(action: {
                           isShowingView.toggle()
                       }) {
                           Text("次へ")
                               .zenFont(.bold, size: 18, color: .navy)
                       }
                       .frame(width: 250, height: 50)
                       .background(Color.white)
                       .cornerRadius(13)
                   }
               }
               .ignoresSafeArea(edges: .bottom)
               
           }
               
           
       }
}

#Preview {
    MondyView()
}
