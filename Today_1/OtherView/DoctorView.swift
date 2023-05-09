//
//  DoctorView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 08.05.2023.
//

import SwiftUI

struct DoctorView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("At the doctor")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .heavy))
        }
    }
}

struct DoctorView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorView()
    }
}
