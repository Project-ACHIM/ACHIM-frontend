//
//  CountPointCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/13.
//

import SwiftUI

struct CountPointCardView: View {
    var body: some View {
        ZStack{
            // 背景
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("hex6CB0FF"), lineWidth: 1)
                )
            
            
            HStack {
                Text("集まったポイント数")
                    .zenFont(.regular, size: 12)
                
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Spacer()
                    
                    Image(.bp)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .alignmentGuide(.firstTextBaseline) { d in d[VerticalAlignment.center] + 10 }
                        .padding(.trailing, 6)
                    
                    Text("100,000")
                        .zenFont(.bold, size: 26, color: Color("hex5D9FED"))
                    
                    Text("pt")
                        .zenFont(.bold, size: 16, color: Color("hex5D9FED"))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.horizontal, 12)
        }
        .frame(width: 350, height: 50)
            

        
    }
}

#Preview {
    CountPointCardView()
}
