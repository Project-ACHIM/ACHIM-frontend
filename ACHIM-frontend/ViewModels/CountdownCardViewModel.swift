//
//  CountdownCardViewModel.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/27.
//

import SwiftUI
import Combine

/// 朝活カウントダウン用のビューモデル
final class CountdownCardViewModel: ObservableObject {
    @Published var timeRemaining: TimeInterval = 0
    @Published var isMorningSession = false         // タイトル切替用
    @Published var activityStarted = false {        // ← 追加
        didSet { updateTime() }                     // 状態変化ですぐ再計算
    }
    
    private var cancellable: AnyCancellable?
    private let calendar = Calendar.current
    
    init() {
        updateTime()
        cancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in self?.updateTime() }
    }
    
    deinit { cancellable?.cancel() }
}

// MARK: - 内部ロジック
private extension CountdownCardViewModel {
    func updateTime() {
        let now = Date()
        
        // 今日の 6:00 & 10:00
        var six = calendar.dateComponents([.year, .month, .day], from: now)
        six.hour = 6; six.minute = 0; six.second = 0
        var ten = six; ten.hour = 10
        
        guard let todaySix = calendar.date(from: six),
              let todayTen = calendar.date(from: ten) else { return }
        
        let target: Date
        
        // ───────── 判定 ─────────
        if activityStarted && now >= todaySix && now < todayTen {
            // 朝活スタート済み & 朝活時間内 → 10:00 まで
            target = todayTen
            isMorningSession = true
        } else {
            // まだ開始していない、または時間外 → 次の 6:00 まで
            if now < todaySix {
                target = todaySix        // 当日 6:00
            } else {
                target = calendar.date(byAdding: .day, value: 1,
                                       to: todaySix)! // 翌日 6:00
            }
            isMorningSession = false
        }
        // ────────────────────────
        
        timeRemaining = max(target.timeIntervalSince(now), 0)
    }
}
