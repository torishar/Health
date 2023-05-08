//
//  TodayView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 08.05.2023.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            //header
            VStack {
                ZStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Today")
                            Text("\(todayDate())")
                        }
                        .opacity(0.3)
                        .font(.system(size: 16))
                        Spacer()
                        Button {
                            //
                        } label: {
                            Image("settings")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .opacity(0.3)
                        }
                    }
                    
                    ZStack {
                        Image("ellipse")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Image("strawberry")
                            .resizable()
                            .frame(width: 33, height: 34)
                            .colorMultiply(Color("Color5"))
                    }
                }
                .padding(.horizontal, 30)
            }
            
            Divider()
                .background(.white)
            
            //title
            VStack {
                HStack {
                    Text("Title")
                        .font(.system(size: 24, weight: .heavy))
                    Spacer()
                    Button {
                        //
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 30)
                                .foregroundColor(.white)
                                .opacity(0.15)
                            Image(systemName: "xmark")
                        }

                    }
                }
                .padding(.horizontal, 30)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ScrollCardsView(title: "Title", content: "content", mask: "mask2")
                        ScrollCardsView(title: "Fingers", content: "The fingers and toes are becoming properly separated, losing any webbing. The fingers and toes are becoming properly separated, losing any webbing.")
                        ScrollCardsView(title: "3", content: "3", mask: "mask1")
                        ScrollCardsView(title: "4", content: "4")
                        ScrollCardsView(title: "5", content: "5", mask: "mask2")
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            //mood
            VStack(alignment: .leading) {
                Text("Mood Breakdown")
                    .font(.system(size: 25, weight: .heavy))
                HStack(alignment: .bottom, spacing: 40) {
                    DiagramView(imageMood: "mood1", rectangleHeight: 21)
                    DiagramView(imageMood: "mood2", rectangleHeight: 51)
                    DiagramView(imageMood: "mood3", rectangleHeight: 73)
                    DiagramView(imageMood: "mood4", rectangleHeight: 21)
                    DiagramView(imageMood: "mood5", rectangleHeight: 83)
                    DiagramView(imageMood: "mood6", rectangleHeight: 100)
                }

            }
            .padding(20)
            .background(Color("Color6"))
            .cornerRadius(30)
            
            //title
            VStack {
                HStack {
                    Text("Title")
                        .font(.system(size: 24, weight: .heavy))
                    Spacer()
                    Button {
                        //
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 30)
                                .foregroundColor(.white)
                                .opacity(0.15)
                            Image(systemName: "xmark")
                        }

                    }
                }
                .padding(.horizontal, 30)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ScrollCardsView(title: "Title", content: "content", mask: "mask2")
                        ScrollCardsView(title: "Fingers", content: "The fingers and toes are becoming properly separated, losing any webbing. The fingers and toes are becoming properly separated, losing any webbing.")
                        ScrollCardsView(title: "3", content: "3", mask: "mask1")
                        ScrollCardsView(title: "4", content: "4")
                        ScrollCardsView(title: "5", content: "5", mask: "mask2")
                    }
                    .padding(.horizontal, 20)
                }
            }
            
        }
        .background(.black)
        .foregroundColor(.white)
    }
    
    func todayDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: Date())
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
