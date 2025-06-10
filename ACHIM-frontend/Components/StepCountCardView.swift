//
//  StepCountCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/08.
//

import SwiftUI

struct StepCountCardView: View {
    let stepCount: Int
    
    var body: some View {
        ZStack {
            Image(.numberBackground)
            HStack {
                VStack(alignment: .leading) {
                    Text("今日の歩数は")
                        .zenFont(.medium, size: 14)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(stepCount.formatted())")
                            .zenFont(.bold, size: 32, color: .navy)
//                            .foregroundColor(Color.blue)
                        
                        Text("歩")
                            .zenFont(.bold, size: 22, color: .navy)
                        
                        Text("です！")
                            .zenFont(.bold, size: 16)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                Image(.character)
            }
            .padding(19)
        }
        .frame(maxWidth: 350, maxHeight: 180)
        
    }
}

#Preview {
    StepCountCardView(stepCount: 15000)
}
