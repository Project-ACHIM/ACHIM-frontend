//
//  SettingView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/07.
//
import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                //アイコン
                ZStack{
                    //画像
                    Image(.myicon)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(100)
                    //画像変更ボタン
                    VStack{
                        Spacer()
                        Button(action: {
                            
                        }){
                            Image(.photo)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        .padding(.top, 60)
                        .padding(.leading, 100)
                    }
                }
                .frame(width: 150, height: 150)
                .padding(.top, 60)
                
                HStack{
                   Text("最優秀賞")
                        .zenFont(.regular, size: 12)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .background(Color.hexFBBC04)
                        .cornerRadius(10)
                }   // HStack
                Spacer()
            }
        }   //ZStack
    }   //body
}   // View

#Preview {
    SettingView()
}
