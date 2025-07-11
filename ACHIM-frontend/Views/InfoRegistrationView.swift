//
//  InfoRegistrationView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/09.
//
import SwiftUI

struct InfoRegistrationView: View {
    var body: some View {
        ZStack {
            VStack() {
                Image(.achimLogo)
                Spacer()
            }
            .padding(.top, 80)
            VStack() {
                Spacer()
                FormBg()
            }
            InfoField()
                .padding(.top, 120)
        }   // ZStack
        .ignoresSafeArea(.all)
    }   // body
}   // View

#Preview {
    InfoRegistrationView()
}
