//
//  HomeView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/02.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @Binding var path: [Page]
    @Binding var selectedPhoto: UIImage?
    
    @StateObject private var viewModel = StepCounterViewModel()
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
                    .frame(height: 80)
                    .padding(.bottom, 17)
                StepCountCardView(stepCount: viewModel.stepCount)
                    .frame(height: 180)
                    .padding(.bottom, 17)
                CountPointCardView()
                    .padding(.bottom, 17)
                UserStatusCardView()
                    .padding(.bottom, 35)
                
                // -------- ボタン or PhotosPicker --------
                if !startedMorningActivity {
                    ActivityButtonView(label: "朝活を始める") {
                        startedMorningActivity = true
                    }
                    .padding(.bottom, 35)
                    
                } else if !photoPosted {
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        ActivityButtonView(label: "写真投稿", asLabelOnly: true)
                    }
                    .padding(.bottom, 35)
                    
                } else {
                    ActivityButtonView(label: "投票") {
                        path.append(.voting) // ← 2回目以降も遷移
                    }
                    .padding(.bottom, 35)
                }
            }
            
            // ヘッダー
            PointHeaderView()
                .frame(maxWidth: .infinity, maxHeight: 60)
                .zIndex(10)
            
            // 確認モーダル
            if photoModel.showModal {
                ZStack {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    PhotoConfirmView(viewModel: photoModel) {
                        // ✅ 確定 → 投票へ
                        selectedPhoto = photoModel.image
                        photoPosted = true
                        selectedItem = nil
                        photoModel.showModal = false
                        path.append(.voting)
                    }
                }
                .zIndex(100)
            }
        }
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
    HomeView(
        path: .constant([]),
        selectedPhoto: .constant(nil)
    )
}
