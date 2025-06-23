//
//  RankingCards.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/14.
//
import SwiftUI

struct RankingCards: View {
    @State var userName: String
    @State var rank: Int
    @State var sp: Int
    var body: some View {
        ZStack {
            //カード背面
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 345, height: 75)
                .foregroundStyle(Color.white)

            //カード内要素
            HStack(alignment: .center, spacing: 16){
                //順位テキスト
                HStack(alignment: .firstTextBaseline, spacing: 4){
                    //順位数字
                    Text("\(rank)")
                        .zenFont(.bold, size: 40, color:Color.hex347CD1)
                    Text("位")
                        .zenFont(.bold, size: 24, color:Color.hex347CD1)
                }
                .frame(width: 50, height: 80)
                //プロフィール画像
                Image(.image)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                // 名前・SP
                VStack(alignment: .trailing, spacing: 8){
                    Text(userName)
                        .zenFont(.medium, size: 16, color:Color.defaultBlack)
                    // SP
                    HStack{
                        Image(.sp)  //SP img
                            .resizable()
                            .frame(width: 25, height: 25)
                        
                        //SP text
                        HStack(alignment: .center, spacing : 4){
                            Text("\(sp)")
                                .zenFont(.bold, size: 20, color:Color.defaultBlack)
                            Text("pt")
                                .zenFont(.bold, size: 14, color:Color.defaultBlack)
                        }
                    }
                }
                .frame(width: 160, height: 80)
            }
            .frame(width: 345, height: 75)
        }
    }
}

#Preview {
    RankingCards(userName: String(), rank: Int(), sp: Int())
}
