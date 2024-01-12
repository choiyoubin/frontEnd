//
//  MainScreen.swift
//
//
//  Created by 최준영 on 2023/12/23.
//

import SwiftUI
import GlobalObjects

public struct MainScreen: View {
    
    public init() { }
    
    public var body: some View {
        ZStack {
            
            // 상단
            VStack(spacing: 0) {
                TopMostScreenComponent()
                    .frame(height: 56)
                SelectMapTagScreenComponent()
                    .frame(height: 64)
                
                Spacer(minLength: 0)
                
            }
            .zIndex(1)
            
            
            ZStack {
                MapScreenComponent()
            }
            .padding(.top, 110)
            .padding(.bottom, 64)
            .zIndex(0)
            
            // 하단
            VStack(spacing: 0) {
                
                Spacer(minLength: 0)
                
                TabScreenComponent()
                    .frame(height: 64)
            }
            .zIndex(1)
            
        }
        .onAppear {
            
            Task {
                
                do {
                    
                    try await APIRequestGlobalObject.shared.getCategory()
                    
                } catch {
                    
                    if let netError = error as? SpotNetworkError {
                        
                        print("카테고리를 불러올 수 없습니다. \(netError)")
                        
                    }
                }
            }
        }
    }
}

#Preview {
    MainScreen()
}
