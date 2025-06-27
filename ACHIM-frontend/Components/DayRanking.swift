//
//  DayRanking.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/27.
//
import SwiftUI

struct DayRankingHeader: View {
    @State var day: Date
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.hex6CB0FF)
                .frame(width: 350, height: 35)
                .cornerRadius(5)
            HStack{
                Image(systemName: "chevron.left")
                    .foregroundStyle(Color.white)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.white)
            }
            .frame(width: 300)
            
            Text("5月10日")
                .zenFont(.bold, size: 18, color: .white)
        }
        .frame(width: 350, height: 35)
    }
}

struct NowRankingCard: View {
    @State var title: String
    @State var sub_text: Int
    @State var point: Int
    @State var bg_color: Color
    @State var is_sub_text_show: Bool
    
    @State var wakeup_time: Int = 5000
    var body: some View {
        ZStack{
            Rectangle()
                .fill(bg_color)
                .frame(width: 350, height: 65)
                .cornerRadius(5)
            Image(.sp)
                .resizable()
                .frame(width: 33, height: 33)
                .padding(.leading, 60)
            HStack{
                VStack(alignment: .leading ) {
                    Text("\(title)")
                        .zenFont(.medium, size: 12, color: .defaultBlack)
                    if(is_sub_text_show){
                        Text("\(sub_text)歩")
                            .zenFont(.medium, size: 12, color: .gray)
                    }
                }
                .padding(.leading, 16)
                
                Spacer()
                
                HStack{
                    Text("\(point)")
                        .zenFont(.bold, size: 24)
                    Text("pt")
                        .zenFont(.bold, size: 16)
                }
                .padding(.trailing, 16)
            }
            .frame(width: 350, height: 65)
        }
    }
}

struct DayRanking: View {
    @State var week_group: Bool = false //trueでウォーキング, falseでランニング
    var body: some View {
        VStack(spacing: 8){
            DayRankingHeader(day: Date())
            
            VStack(spacing: 8){
                //合計ポイント数
                NowRankingCard(title: "合計ポイント数", sub_text: 0, point: Int(999999), bg_color: .hexE6F3FF, is_sub_text_show: false )
                if(week_group){
                    //ウォーキングポイント数
                    NowRankingCard(title: "ウォーキングポイント数", sub_text: 15000, point: Int(200), bg_color: .hexD8EAFF, is_sub_text_show: true )
                }else{
                    //ランニングポイント数
                    NowRankingCard(title: "ランニングポイント数", sub_text: 15000, point: Int(200), bg_color: .hexD8EAFF, is_sub_text_show: true )
                }
                //イベントポイント
                NowRankingCard(title: "イベントポイント数", sub_text: 15000, point: Int(200), bg_color: .hexE6F3FF, is_sub_text_show: false )
                //起床時間
                NowRankingCard(title: "起床時間", sub_text: 15000, point: Int(200), bg_color: .hexD8EAFF, is_sub_text_show: true )
            }
        }
    }
}

#Preview {
    DayRanking()
}
