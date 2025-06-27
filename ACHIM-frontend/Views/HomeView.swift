//
//  HomeView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/02.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @StateObject private var viewModel  = StepCounterViewModel()
    @StateObject private var photoModel = PhotoPickerModel()
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var startedMorningActivity = false
    @State private var photoPosted = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer().frame(height: 60).padding(.bottom, 14)
                
                CountdownCardView()
                    .padding(.bottom, 17)
                StepCountCardView(stepCount: viewModel.stepCount)
                    .padding(.bottom, 17)
                CountPointCardView()
                    .padding(.bottom, 17)
                UserStatusCardView()
                    .padding(.bottom, 35)
                
                // -------- ボタン or PhotosPicker --------
                if !startedMorningActivity {
                    // ① 朝活前
                    ActivityButtonView(label: "朝活を始める") {
                        startedMorningActivity = true
                    }
                    .padding(.bottom, 35)
                    
                } else if !photoPosted {
                    // ② 写真未投稿
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        ActivityButtonView(label: "写真投稿",
                                           asLabelOnly: true)
                    }
                    .padding(.bottom, 35)
                    
                } else {
                    // ③ 写真投稿済み → 投票へ
                    ActivityButtonView(label: "投票") {
                        // 投票画面へのナビゲーションなど
                        print("Go to vote!")
                    }
                    .padding(.bottom, 35)
                }
                
                nav_bar()
            }
            
            // 固定ヘッダー
            PointHeaderView()
                .frame(maxWidth: .infinity, maxHeight: 60)
                .zIndex(10)
            
            // 選択後モーダル
            if photoModel.showModal {
                Color.black.opacity(0.4).ignoresSafeArea()
                PhotoConfirmView(viewModel: photoModel) {
                    // ✅ 写真を確定
                    photoPosted = true          // ← ここでフラグ ON
                    selectedItem = nil          // （任意）Picker をリセット
                    // photoModel.reset()       // 画像をクリアしたい場合はこちら
                }
            }
        }
        // ---------- 画像が変わったら取り込み ----------
        .onChange(of: selectedItem) { _, newItem in
            guard let item = newItem else { return }
            
            Task {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    photoModel.image = uiImage
                    photoModel.showModal = true
                }
            }
        }
        .onAppear {
            viewModel.fetchTodaySteps()
        }
    }
}

#Preview {
    HomeView()
}
