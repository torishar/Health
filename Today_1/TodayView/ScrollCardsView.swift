//
//  ScrollCardsView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 08.05.2023.
//

import SwiftUI

struct ScrollCardsView: View {
    var title: String
    var content: String
    var mask: String?
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Color3"))
                Image(mask ?? "")
            }
            VStack(alignment: .center) {
                Text(title)
                    .font(.system(size: 32))
                    .padding(.vertical, 10)
                Text(content)
                    .font(.system(size: 16))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
        .frame(width: 341, height: 216)
        .cornerRadius(30)
    }
}

