//
//  HomeHeaderSection.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/07/07.
//

import SwiftUI

struct HomeHeaderSection: View {
    @Binding var remainingSeconds: Int
    let stepCount: Int
    @Binding var isMorningSession: Bool
    @Binding var myStatusSymbol: String
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 60).padding(.bottom, 14)
            CountdownCardView(remainingSeconds: $remainingSeconds)
                .frame(height: 80)
                .padding(.bottom, 17)
            StepCountCardView(stepCount: stepCount)
                .frame(height: 180)
                .padding(.bottom, 17)
            CountPointCardView()
                .padding(.bottom, 17)
            UserStatusCardView(myStatus: myStatusSymbol)
                .padding(.bottom, 35)
        }
    }
}
