//
//  InfoField.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/09.
//
import SwiftUI

struct InfoField: View {
    @State var value: Decimal.FormatStyle.FormatInput = 0.0
    @State var email: String = ""
    @State var pass: String = ""
    @State var passConf: String = ""
    @State var name: String = ""        //名前
    @State var age: Int = 0             //年齢

    //ボタン
    @State var SignupButton: Bool = false
    @State var googleButton: Bool = false
    
     var body: some View {
        VStack(spacing: 64) {
            //ログインフォーム
            VStack(alignment: .leading, spacing: 32){
                //メールアドレス
                VStack(alignment: .leading, spacing: 0){
                    Text("ユーザーネーム")
                        .zenFont(.medium, size: 12)
                    TextField("", text: $name)
                        .zenFont(.medium, size: 12, color: .defaultBlack)
                        .frame(width: 300, height: 45)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)    //キーボードの種類指定
                        .onSubmit{
                            print("\(email)")
                        }
                }   // VStack メールアドレス
                
                //パスワード
                VStack(alignment: .leading, spacing: 0){
                    Text("年齢")
                        .zenFont(.medium, size: 12)
                    TextField("Int", value: $age, format: .number)
                        .zenFont(.medium, size: 12, color: .defaultBlack)
                        .background(Color.clear)
                        .frame(width: 300, height: 45)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .onSubmit{
                            print("\(pass)")
                        }
                }   // VStack パスワード
                
                // 都道府県
                InfoPicker()
            
                // 起床時間
                dataPicker()
                
            }   // VStack ログインフォーム
            
            Button(action:{
                SignupButton = true
                print("名前:\(name), 年齢:\(age)")
            }){
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.hex6CB0FF)
                        .frame(width: 100, height: 40)
                    Text("新規作成")
                        .zenFont(.bold, size: 14, color: .white)
                }
            }
    }   //VStack
    .frame(width: 300)
    }
}

#Preview {
    InfoField()
}
