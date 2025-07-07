//
//  RaivalModel.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/29.
//
import SwiftUI

class RaivalModel: ObservableObject {
    // Viewに通知するため @Published をつける
        @Published var rankings: [Raival] = []

    init(){
        //仮データ
        rankings = [
            Raival(rank: 1, name: "ともっきーandもも君", score: 900000),
            Raival(rank: 2, name: "かれんこん", score: 850000),
            Raival(rank: 3, name: "りんりんごごご", score: 800000),
            Raival(rank: 4, name: "EBCDECC", score: 700000),
            Raival(rank: 5, name: "あいうえおかきくけこ", score: 600000)
        ]
    }
}
