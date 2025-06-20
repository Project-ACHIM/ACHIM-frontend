//
//  Rankingheader.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/14.
//  ランキング画面のヘッダー部分
//

import SwiftUI

struct Rankingheader: View {
    var body: some View {
        HStack(alignment:.center){
            //キャラクター
            HStack(alignment: .firstTextBaseline) {
                Image(.achiBody)
                    .padding(.leading, 25)
                Spacer()
            }
            //ランキング参加回数
            Text("第１回目")    //ランキング参加回数表示
                .zenFont(.medium, size:12, color: Color.white)
                .frame(width: 100, height: 25)
                .background(Color.hex6CB0FF)
                .cornerRadius(5)
                .padding(.bottom, 30)
            
            //履歴ボタン
            HStack(alignment: .lastTextBaseline) {
                Spacer()
                RankingHalfsheet()
                .padding(.trailing, 25)
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    Rankingheader()
}

