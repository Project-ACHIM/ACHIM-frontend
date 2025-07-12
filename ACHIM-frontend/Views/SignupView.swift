//
//  SignupView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/09.
//
import SwiftUI

struct SignupView: View {
    //ボタン
    @State var NextButton: Bool = false
    @State var googleButton: Bool = false
    
    var body: some View {
        if NextButton {InfoRegistrationView()}
        else{
        //画面遷移グループ選択へ
            ZStack {
                Color.white.ignoresSafeArea()

                //アッチーロゴ、体
                VStack {
                    Image(.achimLogoS)
                        .padding(.bottom, 25)
                    Image(.achiBodyB)
                    Spacer()
                }
                .frame(height: 735)
                VStack {
                    Spacer()
                    FormBg()
                }
                VStack {
                    Image(.achiArmB)
                    Spacer()
                }
                .frame(height: 445)
                
                VStack(spacing: 48) {
                    SignupField()
                    Button(action:{
                        NextButton = true
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.hex6CB0FF)
                                .frame(width: 100, height: 40)
                            Text("次へ")
                                .zenFont(.bold, size: 14, color: .white)
                        }
                    }   // Button
                }   //VStack
                .frame(width: 300)
                .padding(.top, 120)
            }
            .ignoresSafeArea(.all)
        }
    }   //body
}   // View

#Preview {
    SignupView()
}
