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
            CountdownCardView()
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
