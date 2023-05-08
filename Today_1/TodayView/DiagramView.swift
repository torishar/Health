//
//  DiagramView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 08.05.2023.
//

import SwiftUI

struct DiagramView: View {
    var imageMood: String = "mood1"
    var rectangleHeight: CGFloat
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: 10, height: 100)
                    .foregroundColor(.gray)
                    .clipShape(Capsule())
                Rectangle()
                    .frame(width: 10, height: rectangleHeight)
                    .foregroundColor(Color("Color4"))
                    .clipShape(Capsule())
                    .shadow(color: Color("Color4").opacity(0.8), radius: 3)
            }
            Image(imageMood)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
        }
    }
}
