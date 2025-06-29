//
//  RaivalModel.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/29.
//

import Foundation

// Identifiableプロトコル ⇨ 値が一意(ユニーク)であることを保証する
struct Raival: Identifiable {
    let rank: Int       // 順位
    let name: String    // 名前
    let score: Int      // スコアポイント
    let id = UUID()     // 識別するためのIDを生成
}

struct RaivalModel {
    var raivals = [
        Raival(rank: 1, name: "ともっきーandもも君", score: 900000),
        Raival(rank: 2, name: "かれんこん", score: 850000),
        Raival(rank: 3, name: "りんりんごごご", score: 800000),
        Raival(rank: 4, name: "EBCDECC", score: 700000),
        Raival(rank: 5, name: "あいうえおかきくけこ", score: 600000)
    ]
}
