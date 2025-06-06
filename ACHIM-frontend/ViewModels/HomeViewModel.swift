//
//  HomeViewModel.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/06.
//

import Foundation
class StepCounterViewModel: ObservableObject {
    @Published var stepCount: Int = 0
    
    func fetchTodaySteps() {
        stepCount = 15000
    }
}
