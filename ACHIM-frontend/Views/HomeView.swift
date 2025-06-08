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
        
        VStack {
            Text("朝活終了")
                .frame(width: 350, height: 80)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: Color("5D9FED").opacity(0.7), radius: 4, x: 0, y: 0)
                )
            StepCountCardView(stepCount: viewModel.stepCount)
        }
        .onAppear {
            viewModel.fetchTodaySteps()
        }
    }
}

#Preview {
    HomeView()
}
