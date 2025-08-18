//
//  MondayGroupConf.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/07.
//
import SwiftUI

struct   MondayGroupConf: View {
    @State private var isShowingView: Bool = false  //次へボタン押されてるか
    @State private var isShowingAlert: Bool = false //戻るボタン押されてるか
    @State var bp : Int //bp
    @State var numberString = ""
    
    var body: some View {
        if isShowingView { TabCardView() } //画面遷移グループ選択へ
        else if isShowingAlert { MondayGroup(bp: 50000) }
        else{
            ZStack {
                Color.white.ignoresSafeArea()
                VStack {
                    
                    // お疲れテキスト
                    VStack {
                        VStack{
                            Text("今週も頑張りましょう！")
                                .zenFont(.bold, size: 16, color: .defaultBlack)
                            Text("グループ選択")
                                .zenFont(.bold, size: 30, color: .navy)
                            Text("今週参加するグループを選択してください")
                                .zenFont(.regular, size: 14, color: .defaultBlack)
                        }
                    }
                    .padding(.top, 40)
                    
                    //グループ選択
                    GroupSelection()
                    
                    VStack{
                        Text("ポイント追加")
                            .zenFont(.bold, size: 30, color: .navy)
                        Text("グルーで賭けるポイント数を決めてください")
                            .zenFont(.regular, size: 14, color: .defaultBlack)
                    }
                    .padding(.top, 48)
                    VStack(spacing: 8) {
                        ZStack{
                            Image(.bp)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 55)
                            HStack {
                                Text("保有ポイント")
                                    .zenFont(.regular, size: 12, color: .defaultBlack)
                                Spacer()
                                
                                //bp
                                HStack {
                                    Text("\(bp)")
                                        .zenFont(.bold, size: 24, color: .defaultBlack)
                                    
                                    Text("pt")
                                        .zenFont(.bold, size: 16, color: .defaultBlack)
                                }
                            }
                        }
                        .frame(width: 320)
                        
                        //Line
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.hexB0B0B0))
                            .frame(width: 330, height: 1)
                    }
                    
                    VStack(spacing: 0){
                        TextField("賭けるポイント", text: $numberString)
                            .zenFont(.regular, size: 14)
                            .frame(width: 330, height: 55)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onSubmit {
                                print(numberString)
                            }
                        
                        HStack() {
                            Text("100 ~ 10,000pt以内で追加できます")
                                .zenFont(.regular, size: 10, color: .defaultBlack)
                            Spacer()
                        }
                        .frame(width: 325)
                        
                    }
                    
                    Spacer()
                    //footer
                    ZStack {
                        Rectangle()
                            .fill(Color.navy)
                            .frame(height: 120)
                        
                        // 戻るボタン
                        HStack(spacing: 32) {
                            Button(action: {
                                isShowingAlert = true
                                print("グループ選択画面へ")
                            }) {
                                HStack {
                                    Text("戻る")
                                        .zenFont(.bold, size: 18, color: .navy)
                                }
                                .frame(width: 140, height: 50)
                                .background(Color.white)
                                .cornerRadius(13)
                            }
                            
                            .padding(.bottom, 24)
                            
                            // 次へボタン
                            Button(action: {
                                isShowingView = true
                                print("メイン画面へ")
                            }) {
                                HStack {
                                    Text("次へ")
                                        .zenFont(.bold, size: 18, color: .navy)
                                }
                                .frame(width: 140, height: 50)
                                .background(Color.white)
                                .cornerRadius(13)
                            }
                            
                            .padding(.bottom, 24)
                        }
                    }   //ZStack
                }   //VStack
                .ignoresSafeArea(edges: .bottom)
            }
        }   //else
    }   //body
}   //View

#Preview {
    MondayGroupConf(bp: 500000)
}
