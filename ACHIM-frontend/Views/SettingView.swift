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
                ZStack{
                    Image(.myicon)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(100)
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
                Spacer()
            }
        }
    }
}

#Preview {
    SettingView()
}
