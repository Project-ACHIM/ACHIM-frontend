//
//  HomeView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/02.
//
import SwiftUI
import PhotosUI

struct HomeView: View {
    @StateObject private var countdownModel = CountdownCardViewModel()
    @StateObject private var viewModel = StepCounterViewModel()
    @StateObject private var photoModel = PhotoPickerModel()
    @State private var didFinishMorningActivity = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var startedMorningActivity = false
    @State private var photoPosted = false
    @State private var selectedPhoto: UIImage?
    @State private var isShowingVoting = false
    @State private var isAfter6PM = false
    @State private var remainingSeconds: Int = 0
    @State private var isMorningSession: Bool = false
    @State private var myStatusSymbol: String = "－"
    @State private var showTodayPhotoModal = false
    @State private var hasShownTodayPhotoModal = false
    
    func checkIfAfter6PM() {
        let now = Calendar.current.dateComponents([.hour], from: Date())
        if let hour = now.hour {
            isAfter6PM = hour >= 18
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    HomeHeaderSection(
                        remainingSeconds: $remainingSeconds,
                        stepCount: viewModel.stepCount,
                        isMorningSession: $countdownModel.isMorningSession,
                        myStatusSymbol: $myStatusSymbol
                    )
                    
                    if !startedMorningActivity && !didFinishMorningActivity {
                        ActivityButtonView(label: "朝活を始める") {
                            startedMorningActivity = true
                            myStatusSymbol = "◯"
                            if !hasShownTodayPhotoModal {
                                showTodayPhotoModal = true
                                hasShownTodayPhotoModal = true
                            }
                        }
                        .disabled(!countdownModel.isMorningSession)
                        .opacity(countdownModel.isMorningSession ? 1.0 : 0.5)
                        .padding(.bottom, 35)
                        
                    } else {
                        HomeActionSection(
                            startedMorningActivity: $startedMorningActivity, // ← 順番を定義通りに！
                            photoPosted: $photoPosted,
                            selectedPhoto: $selectedPhoto,
                            selectedItem: $selectedItem,
                            isShowingVoting: $isShowingVoting,
                            isAfter6PM: $isAfter6PM,
                            didFinishMorningActivity: $didFinishMorningActivity,
                            myStatusSymbol: $myStatusSymbol
                        )
                    }
                }
                
                PointHeaderView()
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .zIndex(10)
                
                if photoModel.showModal {
                    ZStack {
                        Color.black.opacity(0.4).ignoresSafeArea()
                        PhotoConfirmView(viewModel: photoModel) {
                            selectedPhoto = photoModel.image
                            photoPosted = true
                            selectedItem = nil
                            photoModel.showModal = false
                        }
                    }
                    .zIndex(100)
                }
                
                if showTodayPhotoModal {
                    Color.black.opacity(0.4).ignoresSafeArea().zIndex(100)
                    TodayPhotoModalView {
                        showTodayPhotoModal = false
                    }
                    .zIndex(101)
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
                checkIfAfter6PM()
                Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
                    checkIfAfter6PM()
                }
            }
            
            
            if let img = selectedPhoto {
                NavigationLink(isActive: $isShowingVoting) {
                    VotingView(photo: img)
                } label: {
                    EmptyView()
                }
                .hidden()
            }
            
        }
        
    }
}

#Preview {
    HomeView()
}
