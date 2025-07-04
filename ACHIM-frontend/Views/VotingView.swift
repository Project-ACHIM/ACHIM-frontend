//
//  VotingView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/30.
//

import SwiftUI

struct VotingView: View {
    @StateObject private var viewModel = StepCounterViewModel()
    @State private var didVote         = false
    @Environment(\.dismiss) private var dismiss
    let photo: UIImage  // 必ず unwrap 自信があるなら非 Optional
    
    
    var body: some View {
        VStack(spacing: 0) {
            PointHeaderView()
                .frame(maxWidth: .infinity, maxHeight: 60)
                .zIndex(10)
            
            CountdownCardView()
                .frame(height: 50)
                .padding(.top, 15)
                .padding(.bottom, 10)
            
            StepCountCardView(stepCount: viewModel.stepCount)
                .frame(height: 50)
                .padding(.bottom, 15)
            
            VoteCardView(didVote: $didVote, photo: photo)
                .padding(.top, 10)
            
            ActivityButtonView(label: "Homeに戻る", isPrimary: true) {
                dismiss()
            }
            .padding(.top, 20)
        }
        .navigationBarBackButtonHidden(true)  // ← ここ
    }
}

#Preview{
    VotingView(photo: UIImage(systemName: "photo")!)
}
