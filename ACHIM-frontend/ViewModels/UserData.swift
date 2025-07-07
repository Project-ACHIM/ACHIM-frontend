//
//  UserData.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/07.
//
import Foundation

// Identifiableプロトコル ⇨ 値が一意(ユニーク)であることを保証する
struct Raival: Identifiable {
    let rank: Int       // 順位
    let name: String    // 名前
    let score: Int      // スコアポイント
    let id = UUID()     // 識別するためのIDを生成
}
