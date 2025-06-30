//
//  RootNavigationView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/30.
//

import SwiftUI
import PhotosUI


enum Page: Hashable {
    case voting
}

struct RootNavigationView: View {
    @State private var path: [Page] = []
    @State private var selectedPhoto: UIImage? = nil
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeView(path: $path, selectedPhoto: $selectedPhoto)
                .navigationDestination(for: Page.self) { page in
                    switch page {
                    case .voting:
                        VotingView(path: $path, photo: selectedPhoto)
                    }
                }
        }
    }
}
