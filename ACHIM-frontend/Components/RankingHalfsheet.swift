//
//  RankingHalfsheet.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/20.
//
import SwiftUI

public struct RankingHalfsheet: View {
    @State private var showModalSheet = false
    public var body: some View {
        Button("履歴") {
                    showModalSheet = true
                }
                .zenFont(.medium, size:12, color: Color.defaultBlack)
                .frame(width: 50, height: 25)
                .background(Color.baseSky)
                .cornerRadius(5)
                .sheet(isPresented: $showModalSheet) {
                    ZStack {
                        Text("ハーフモーダル")
                    }
                    .presentationDetents([.large, .height(600), .fraction(0.5)])
                    .cornerRadius(100)
                }
                
    }
}

#Preview {
        RankingHalfsheet()
}
