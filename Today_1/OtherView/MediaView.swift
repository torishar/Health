//
//  MediaView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 08.05.2023.
//

import SwiftUI

struct MediaView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("Media")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .heavy))
        }
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView()
    }
}
