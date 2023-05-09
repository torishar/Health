//
//  AdditionalView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 09.05.2023.
//

import SwiftUI

struct AdditionalView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("Additional View")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .heavy))
        }
        
    }
}

struct AdditionalView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalView()
    }
}
