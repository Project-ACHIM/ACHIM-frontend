//
//  CountdownCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/09.
//

import SwiftUI

struct CountdownCardView: View {
    // ViewModel を保持
    @StateObject private var viewModel = CountdownCardViewModel()
    
    var body: some View {
        ZStack {
            // 背景カード
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color("hex5D9FED").opacity(0.7),
                        radius: 4, x: 0, y: 0)
            
            // 中央コンテンツ
            VStack(spacing: -12) {
                Text(viewModel.isMorningSession ? "朝活終了まで残り"
                     : "次の朝活まで残り")
                .zenFont(.regular, size: 12)
                
                Text(formattedTime(from: viewModel.timeRemaining))
                    .zenFont(.bold, size: 40, color: .navy)
            }
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 80)
    }
    
    /// 秒数を `HH:mm:ss` 文字列に変換
    private func formattedTime(from seconds: TimeInterval) -> String {
        let total = Int(seconds.rounded())
        let h = total / 3600
        let m = (total % 3600) / 60
        let s = total % 60
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
}

#Preview {
    CountdownCardView()
}
