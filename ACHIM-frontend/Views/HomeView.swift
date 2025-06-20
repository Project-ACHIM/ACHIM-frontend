//
//  HomeView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/02.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = StepCounterViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()
            
            // 下のメイン内容
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 60) // ← 上のPointHeaderViewの高さ分下げる
                    .padding(.bottom , 14)
                
                CountdownCardView()
                    .padding(.bottom , 17)
                StepCountCardView(stepCount: viewModel.stepCount)
                    .padding(.bottom , 17)
                CountPointCardView()
                    .padding(.bottom , 17)
                UserStatusCardView()
                    .padding(.bottom , 35)
                ActivityButtonView()
                    .padding(.bottom , 35)
                
                nav_bar()
            }
            
            // 最上部に常に固定されるPointHeaderView
            PointHeaderView()
                .frame(maxWidth:.infinity, maxHeight: 60)
                .zIndex(10)

        }
        .frame(maxWidth: .infinity)
        .onAppear {
            viewModel.fetchTodaySteps()
        }
    }
}

#Preview {
    HomeView()
}
