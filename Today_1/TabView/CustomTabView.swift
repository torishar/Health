//
//  CustomTabView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 08.05.2023.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab: String
    var imageTab: String
    var nameTab: String
    var body: some View {
        Button {
            currentTab = imageTab
        } label: {
            VStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: (UIScreen.main.bounds.width - 60) / 3, height: 5)
                    .clipShape(Capsule())
                    .shadow(color: currentTab == imageTab ? Color.white.opacity(0.8) : Color.clear, radius: 8)
                    .blendMode(.screen)
                HStack {
                    Image(imageTab)
                        .resizable()
                        .frame(width: 21, height: 21)
                    Text(nameTab)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            .opacity(currentTab == imageTab ? 1 : 0.3)
        }
    }
}
