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
                        .font(.system(size: 14, weight: .bold))
//                        .foregroundColor(.defaultBlack)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(stepCount.formatted())")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color.blue)
                        
                        Text("歩")
                            .font(.system(size: 22, weight: .bold))
//                            .foregroundColor(.defaultBlack)
                        
                        Text("です！")
                            .font(.system(size: 16, weight: .bold))
//                            .foregroundColor(.defaultBlack)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                Image(.character)
            }
            .padding(19)
        }
        .frame(maxWidth: 350, maxHeight: 180)
        .foregroundColor(.defaultBlack)
        
    }
}

#Preview {
    StepCountCardView(stepCount: 15000)
}
