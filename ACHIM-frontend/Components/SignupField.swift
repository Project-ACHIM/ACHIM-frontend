//
//  SignupField.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/09.
//

import SwiftUI

struct SignupField: View {
    @State var email: String = ""
    @State var pass: String = ""
    @State var passConf: String = ""
    //ボタン
    @State var NextButton: Bool = false
    @State var googleButton: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            //ログインフォーム
            VStack(alignment: .center, spacing: 32){
                //メールアドレス
                VStack(alignment: .leading, spacing: 0){
                    Text("メールアドレス")
                        .zenFont(.medium, size: 12)
                    TextField("", text: $email)
                        .zenFont(.regular, size: 12, color: .defaultBlack)
                        .frame(width: 300, height: 45)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)    //キーボードの種類指定
                        .onSubmit{
                            print("\(email)")
                        }
                }   // VStack メールアドレス
                
                //パスワード
                VStack(alignment: .leading, spacing: 0){
                    Text("パスワード")
                        .zenFont(.medium, size: 12)
                    TextField("", text: $pass)
                        .zenFont(.regular, size: 12, color: .defaultBlack)
                        .background(Color.clear)
                        .frame(width: 300, height: 45)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.asciiCapable)
                        .onSubmit{
                            print("\(pass)")
                        }
                }   // VStack パスワード
                //パスワード確認
                VStack(alignment: .leading, spacing: 0){
                    Text("パスワード確認")
                        .zenFont(.medium, size: 12)
                    TextField("", text: $passConf)
                        .zenFont(.regular, size: 12, color: .defaultBlack)
                        .background(Color.clear)
                        .frame(width: 300, height: 45)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.asciiCapable)
                        .onSubmit{
                            print("\(passConf)")
                        }
                }   // VStack パスワード
            }   // VStack ログインフォーム
            
            //Googleログイン
            Button(action:{
                googleButton = true
                print("Googleログイン")
            }){
                Image(.iosNeutralSqSI)
            }
            .buttonStyle(.plain)
            
            
            Button(action:{
                NextButton = true
                print("email:\(email), pass:\(pass), pass確認:\(passConf)")
            }){
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.hex6CB0FF)
                        .frame(width: 100, height: 40)
                    Text("次へ")
                        .zenFont(.bold, size: 14, color: .white)
                }
            }
    }   //VStack
    .frame(width: 300)
    }
}

