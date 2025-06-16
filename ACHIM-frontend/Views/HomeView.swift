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
        VStack{
            VStack {
                PointHeaderView()
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
                    .padding(.bottom , 25)
                
                Spacer()
                
                nav_bar()
                    .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .onAppear {
            viewModel.fetchTodaySteps()
        }
    }
}

#Preview {
    HomeView()
}
