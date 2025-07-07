//
//  RankingRival.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/29.
//
import SwiftUI

struct RankingRival: View {
    @StateObject private var viewModel = RaivalModel()
    var body: some View {
        VStack(alignment: .center,spacing: 20){
            ForEach(viewModel.rankings){ user in
                RankingCards(userName: user.name, rank: user.rank, sp: user.score)
            }
//            RankingCards(userName: viewModel.rankings[0].name, rank: 1, sp: 1000000)
//            RankingCards(userName: "ライバルネーム", rank: 2, sp: 900000)
//            RankingCards(userName: "ライバルネーム", rank: 3, sp: 800000)
//            RankingCards(userName: "ライバルネーム", rank: 4, sp: 700000)
//            RankingCards(userName: "ライバルネーム", rank: 5, sp: 500000)
        }
        
    }
}

#Preview {
    RankingRival()
}
