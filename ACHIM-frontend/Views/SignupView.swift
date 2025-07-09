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
        ZStack {
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
            
            VStack() {
                SignupField()
            }   //VStack
            .frame(width: 300)
            .padding(.top, 100)
        }
        .ignoresSafeArea(.all)
    }   //body
}   // View

#Preview {
    SignupView()
}
