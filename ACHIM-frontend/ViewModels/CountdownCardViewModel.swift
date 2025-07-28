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
    @Published var isMorningSession: Bool = false
    @Published var activityStarted = false { // ← 使うなら外向けの状態用途
        didSet { updateTime() }
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
        
        // ⏰ 朝活時間 → 6:00〜10:00
        var six = calendar.dateComponents([.year, .month, .day], from: now)
        six.hour = 9; six.minute = 0; six.second = 0
        var ten = six; ten.hour = 13
        
        guard let todaySix = calendar.date(from: six),
              let todayTen = calendar.date(from: ten) else { return }
        
        // 朝活時間中かどうかを時刻だけで判定
        isMorningSession = (now >= todaySix && now < todayTen)
        
        let target: Date
        if isMorningSession {
            // 朝活中 → 終了まで
            target = todayTen
        } else {
            // 朝活外 → 次の開始まで
            target = now < todaySix
            ? todaySix
            : calendar.date(byAdding: .day, value: 1, to: todaySix)!
        }
        
        timeRemaining = max(target.timeIntervalSince(now), 0)
    }
}
