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
            HeaderTodayView()
            
            Divider()
                .background(.white)
            
            //title
            TitleTodayView()
            
            //mood
            MoodTodayView()
            
            //title
            TitleTodayView()
                .padding(.bottom, 80)
            
        }
        .background(.black)
        .foregroundColor(.white)
    }
    

}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}


//MARK: - header
struct HeaderTodayView: View {
    
    @State private var showSettings = false
    @ObservedObject var todayVM = TodayViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Today")
                        Text(todayVM.todayDate())
                    }
                    .opacity(0.4)
                    .font(.system(size: 16))
                    Spacer()
                    Button {
                        self.showSettings.toggle()
                    } label: {
                        Image("settings")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .opacity(0.4)
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView()
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
            .padding(.horizontal, 20)
        }
    }
}

//MARK: - title
struct TitleTodayView: View {
    @State var cardOffset: CGFloat = 0
    @ObservedObject var cardVM = CardViewModel()

    var body: some View {
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
            VStack {
                GeometryReader {g in
                    HStack {
                        ForEach(cardVM.scrollCardsData.indices, id: \.self) { index in
                            ScrollCardsView(
                                title: cardVM.scrollCardsData[index].title,
                                content: cardVM.scrollCardsData[index].content,
                                mask: cardVM.scrollCardsData[index].mask
                            )
                        }
                    }
                    .offset(x: -(self.cardOffset * (UIScreen.main.bounds.width * 0.85 )))
                }
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            if value.translation.width > 10 {
                                if self.cardOffset > 0 {
                                    self.cardOffset -= 1
                                }
                            } else if value.translation.width < -10 {
                                if self.cardOffset < 4 {
                                    self.cardOffset += 1
                                }
                            }
                        })
                )
            }
            .frame(height: 216)
            PageIndicator(currentPage: Int(self.cardOffset), pageCount: 5)
                .padding(10)
                .foregroundColor(.white)
        }
        .padding(20)
        
    }
}

struct PageIndicator: View {
    let currentPage: Int
    let pageCount: Int

    var body: some View {
        HStack {
            ForEach(0..<pageCount, id: \.self) { index in
                Circle()
                    .fill(currentPage == index ? Color.white : Color.white.opacity(0.3))
                    .frame(width: 10, height: 10)
            }
        }
    }
}


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
                    .resizable()
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
        .frame(width: UIScreen.main.bounds.width * 0.85, height: 216)
        .cornerRadius(30)
    }
}

//MARK: - mood
struct MoodTodayView: View {
    
    @ObservedObject var moodVM = MoodViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mood Breakdown")
                .font(.system(size: 25, weight: .heavy))
            HStack(alignment: .bottom, spacing: 40) {
                ForEach(moodVM.moodBreakdown.indices, id: \.self) { index in
                    DiagramView(imageMood: moodVM.imageMood[index], rectangleHeight: CGFloat(moodVM.moodBreakdown[index]))
                }
            }
        }
        .padding(20)
        .background(Color("Color6"))
        .cornerRadius(30)
    }
}

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
