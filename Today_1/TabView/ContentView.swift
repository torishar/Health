//
//  ContentView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 08.05.2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: [String] = []
    
    func resolve (pathItem: String) -> some View {
        Group {
            switch pathItem {
            case "doctor": DoctorView()
            case "today": TodayView()
            case "media": MediaView()
            default:
                EmptyView()
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject private var coordinator = Coordinator()
    @State private var selectedBtn: String = "today"
    
        init() {
            UITabBar.appearance().isHidden = true
        }
    
    var body: some View {
        TabView(selection: $coordinator.path) {
            ZStack(alignment: .bottom) {
                coordinator.resolve(pathItem: coordinator.path.last ?? "today")
                HStack {
                    Spacer()
                    ButtonContent(
                        imageTab: "doctor",
                        nameTab: "At the doctor",
                        action: {
                            selectedBtn = "doctor";
                            coordinator.path = ["doctor"]
                            print(coordinator.path)
                        },
                        isSelected:
                            selectedBtn == "doctor")
                    ButtonContent(
                        imageTab: "today",
                        nameTab: "Today",
                        action: {
                            selectedBtn = "today";
                            coordinator.path = ["today"]
                            print(coordinator.path)
                        },
                        isSelected:
                            selectedBtn == "today")
                    ButtonContent(
                        imageTab: "media",
                        nameTab: "Media",
                        action: {
                            selectedBtn = "media";
                            coordinator.path = ["media"]
                            print(coordinator.path)
                        },
                        isSelected:
                            selectedBtn == "media")
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
            .navigationDestination(for: String.self) { dest in
                coordinator.resolve(pathItem: dest)
            }
        }
        .environmentObject(coordinator)
    }
}


extension View {
    func ButtonContent (imageTab: String, nameTab: String, action: (() -> Void)?, isSelected: Bool) -> some View {
        Button {
            action?()
        } label: {
            VStack {
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width - 60) / 3, height: 5)
                    .clipShape(Capsule())
                    .shadow(color: isSelected ? Color.white.opacity(0.8) : Color.clear, radius: 8)
                    .blendMode(.screen)
                HStack {
                    Image(imageTab)
                        .resizable()
                        .frame(width: 21, height: 21)
                    Text(nameTab)
                        .font(.system(size: 14))
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            .foregroundColor(.white)
            .opacity(isSelected ? 1 : 0.3)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
