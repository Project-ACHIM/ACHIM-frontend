//
//  ranking.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/13.
//
import SwiftUI

struct ranking: View {
    var body: some View {
        
        //全体のアイテム
            VStack {
                //タイトル
                Text("ランキング")
                    .zenFont(.bold, size:32, color: Color.white)
                    .stroke(color: Color.hex5D9FED, width: 2)
                
                
               //line, arm
                ZStack {
                    //ヘッダーアイテム
                    HStack(alignment:.center){
                        //キャラクター
                        HStack(alignment: .firstTextBaseline) {
                            Image(.achiBody)
                                .padding(.top, 25)
                                .padding(.leading, 25)
                            Spacer()
                        }
                        
                        Text("第１回目")
                            .zenFont(.medium, size:12, color: Color.white)
                            .frame(width: 100, height: 25)
                            .background(Color.hex6CB0FF)
                            .cornerRadius(5)
                        //履歴ボタン
                        HStack(alignment: .lastTextBaseline) {
                            Spacer()
                            Button(action: {
                                //履歴選択処理
                            }, label:{
                                Text("履歴")
                                    .zenFont(.medium, size:12, color: Color.defaultBlack)
                            })
                            .frame(width: 50, height: 25)
                            .background(Color.baseSky)
                            .cornerRadius(5)
                            .padding(.trailing, 25)
                        }
                    }
                    
                    VStack(alignment: .trailing) {
                        Spacer()
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 350, height: 2)
                            .padding(.bottom, 25)
                    }
                    
                    
                    HStack() {
                        Image(.achiArm)
                            .padding(.top, 50)
                    }
                        
                        
                }
//                ↓画面サイズを取得してwidthに
                .frame(height: 80)
                
                Spacer()
            }
        
    }
}
#Preview {
    ranking()
}
