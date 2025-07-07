//
//  CountdownCardView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/09.
//

import SwiftUI

struct CountdownCardView: View {
    @Binding var remainingSeconds: Int
    @StateObject private var viewModel = CountdownCardViewModel()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color("hex5D9FED").opacity(0.7),
                        radius: 4, x: 0, y: 0)
            
            GeometryReader { geo in
                let isCompact = geo.size.height <= 50
                
                Group {
                    if isCompact {
                        HStack {
                            Text(viewModel.isMorningSession ? "朝活終了まで残り"
                                 : "次の朝活まで残り")
                            .zenFont(.regular, size: 12)
                            
                            Spacer()
                            
                            Text(formattedTime(from: viewModel.timeRemaining))
                                .zenFont(.bold, size: 24, color: .defaultBlack)
                        }
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        VStack(spacing: -12) {
                            Text(viewModel.isMorningSession ? "朝活終了まで残り"
                                 : "次の朝活まで残り")
                            .zenFont(.regular, size: 12)
                            
                            Text(formattedTime(from: viewModel.timeRemaining))
                                .zenFont(.bold, size: 40, color: .navy)
                        }
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .frame(width: 350)
        .onReceive(viewModel.$timeRemaining) { newValue in
            remainingSeconds = Int(newValue)
        }
    }
    
    private func formattedTime(from seconds: TimeInterval) -> String {
        let total = Int(seconds.rounded())
        let h = total / 3600
        let m = (total % 3600) / 60
        let s = total % 60
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
}
