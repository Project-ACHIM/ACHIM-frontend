//
//  VotingView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/30.
//

import SwiftUI

struct VotingView : View {
    @StateObject private var viewModel = StepCounterViewModel()
    @State private var didVote = false
    @Environment(\.dismiss) private var dismiss
    @Binding var path: [Page]
    let photo: UIImage?
    
    var  body: some View{
        // 固定ヘッダー
        PointHeaderView()
            .frame(maxWidth: .infinity, maxHeight: 60)
            .zIndex(10)
        
        CountdownCardView()
            .frame(height: 50)
            .padding(.top,15)
            .padding(.bottom,5)
        
        StepCountCardView(stepCount: viewModel.stepCount)
            .frame(height: 50)
            .padding(.bottom,15)
        
        // ✅ 投稿写真表示
        if let photo = photo {
            Image(uiImage: photo)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(12)
                .padding(.bottom, 10)
        }
        
        // 投票カード
        VoteCardView(didVote: $didVote)
            .padding(.top, 20)
        
        // Homeに戻るボタン
        ActivityButtonView(label: "Homeに戻る", isPrimary: false) {
            path.removeLast(path.count) // ← Home に戻る
        }
        .padding(.top, 20)
    }
    
}

#Preview {
    VotingView(
        path: .constant([]),
        photo: UIImage(systemName: "photo")
    )
}

