//
//  InfoRegistrationView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/09.
//
import SwiftUI

struct InfoRegistrationView: View {
    @State var SignupButton: Bool = false
    var body: some View {
        if SignupButton {MondayGroup(bp: 150000)}
        else{
            ZStack {
                Color.white.ignoresSafeArea()
                VStack() {
                    Image(.achimLogo)
                    Spacer()
                }
                .padding(.top, 80)
                VStack() {
                    Spacer()
                    FormBg()
                }
                VStack(spacing: 48){
                    InfoField()
                    
                    Button(action:{
                        SignupButton = true
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.hex6CB0FF)
                                .frame(width: 100, height: 40)
                            Text("新規作成")
                                .zenFont(.bold, size: 14, color: .white)
                        }
                    }
                }
                .padding(.top, 120)
            }   // ZStack
            .ignoresSafeArea(.all)
        }   // else
    }   // body
}   // View

#Preview {
    InfoRegistrationView()
}
