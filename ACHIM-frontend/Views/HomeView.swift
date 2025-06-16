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
            CountPointCardView()
            UserStatusCardView()
            ActivityButtonView()
//            buttomの使い方：文字変更は下の通り
//            ActivityButtonView(label: "写真投稿")
        }
        .onAppear {
            viewModel.fetchTodaySteps()
        }
    }
}

#Preview {
    HomeView()
}
