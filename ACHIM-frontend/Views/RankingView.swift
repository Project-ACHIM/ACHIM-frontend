//
//  RankingView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/20.
//
import SwiftUI

struct RankingView: View {
    @State var ShowFullScreenCover: Bool = false
    var body: some View {
        //全体のアイテム
        ZStack {
            VStack {
                Text("ランキング")
                    .zenFont(.bold, size:32, color: Color.white)
                    .stroke(color: Color.hex5D9FED, width: 2)

                //画面サイズ取得
                GeometryReader{ GeometryReader  in
                    let view_maxX = GeometryReader.frame(in: .local).maxX   //画面サイズ横
                    let View_maxY = GeometryReader.frame(in: .local).maxY   //画面サイズ縦
                    
                    VStack {
                        ZStack(alignment: .top) {
                            //ヘッダーアイテム
                            Rankingheader()
                            //線
                            VStack(alignment: .trailing) {
                                Spacer()
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 350, height: 2)
                                    .foregroundStyle(Color.hex347CD1)
                                    .padding(.bottom, 30)
                            }
                            .frame(height: 80)
                            
                            //背景
                            Path{ Path in
                                Path.move(to: CGPoint(x: 0, y: 50))
                                Path.addLine(to: CGPoint(x: view_maxX, y: 50))
                                Path.addLine(to: CGPoint(x: view_maxX, y: View_maxY))
                                Path.addLine(to: CGPoint(x: 0, y: View_maxY))
                            }
                            .fill(Color.baseSky)
                            //achi 手
                            HStack(alignment: .firstTextBaseline) {
                                Image(.achiArm)
                                    .padding(.leading, 38)
                                    .padding(.top, 44)
                                Spacer()
                            }
                            .frame(width: view_maxX)
                        }
                    }
                }
            }
            //ランキング
            VStack{
                Spacer()
    
                VStack(alignment: .center,spacing: 20){
                    VStack(spacing: 16){
                        Button(action:{
                            ShowFullScreenCover.toggle()
                        }){
                            RankingMyCard(userName: "マイネーム", rank: 5, sp: 500000)
                        }
                        
                    }.fullScreenCover(isPresented: $ShowFullScreenCover) {
                        RankingHistory()
                    }
                    
                    RankingRival()
                    .frame(width: 400, height: 450)
                }
                .frame(height: 600)
            }
        }
    }
}

#Preview {
    RankingView()
}
