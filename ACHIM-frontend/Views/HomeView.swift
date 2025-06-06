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
        ZStack{
            Image(.numberBackground)
            HStack{
                VStack(alignment: .leading) {
                    Text("今日の歩数は")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(viewModel.stepCount.formatted())")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color.blue)
                        
                        Text("歩")
                            .font(.system( size: 22, weight: .bold))
                            .foregroundColor(.black)
                        
                        Text("です！")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                Image(.character)
            }.padding(19)
        }
        .frame(maxWidth: 350, maxHeight: 180)
        .onAppear {
            viewModel.fetchTodaySteps()
        }
    }
}

#Preview {
    HomeView()
}
