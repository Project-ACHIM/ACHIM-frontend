//
//  GroupSelection.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/06/30.
//
import SwiftUI

struct GroupSelection: View {
    @State var walk : Bool = false
    @State var run : Bool = false
    var body: some View {
        HStack {
            Button(action:{
                walk = true
                print("ウォーキンググループを選択")
            }){
                //ウォーキング
                ZStack {
                    Rectangle()
                        .fill(Color.hexFBBC04)
                        .frame(width: 145, height: 180)
                        .cornerRadius(10)
                    
                    VStack {
                        Text("ウォーキンググループ")
                            .zenFont(.bold, size: 12, color: .white)
                        ZStack {
                            Image(.achiWalk)
                                .resizable()
                                .frame(width: 120, height: 130)
                                .cornerRadius(5)
                        }
                    }
                }
            }
            
            Button(action:{
                run = true
                print("ランニンググループを選択")
            }){
                //ランニング
                ZStack {
                    Rectangle()
                        .fill(Color.navy)
                        .frame(width: 145, height: 180)
                        .cornerRadius(10)
                    
                    VStack {
                        Text("ランニンググループ")
                            .zenFont(.bold, size: 12, color: .white)
                        ZStack {
                            Image(.achiRun)
                                .resizable()
                                .frame(width: 120, height: 130)
                                .cornerRadius(5)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    GroupSelection()
}
