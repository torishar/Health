//
//  CustomToggleStyle.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 10.05.2023.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    
    var onColor = Color("Color7")
    var offColor = Color.white
    
    var onColorRectangle = Color.white
    var offColorRectangle = Color.gray
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? onColorRectangle : offColorRectangle)
                .frame(width: 50, height: 32)
                .overlay{
                    Circle()
                        .frame(width: 29)
                        .foregroundColor(configuration.isOn ? onColor : offColor)
                        .offset(x: configuration.isOn ? 10 : -10)
                }
                .frame(width: 50, height: 32)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}


