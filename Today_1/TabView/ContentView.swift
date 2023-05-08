//
//  ContentView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 08.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectionTab: String = "today"
    
    var views = ["doctor", "today", "media"]
    var names = ["At the doctor", "Today", "Media"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectionTab) {
                DoctorView()
                    .tag("doctor")
                TodayView()
                    .tag("today")
                MediaView()
                    .tag("media")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                Spacer()
                ForEach(views.indices, id: \.self) { index in
                    CustomTabView(currentTab: $selectionTab, imageTab: views[index], nameTab: names[index])
                }
                Spacer()
            }
            .padding(.top, 100)
            .background(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0), location: 0),
                        .init(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.8), location: 0.6),
                        .init(color: .init(.sRGB, red: 0, green: 0, blue: 0, opacity: 1), location: 1)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
