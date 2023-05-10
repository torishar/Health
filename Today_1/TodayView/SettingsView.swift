//
//  SettingsView.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 09.05.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isNotification = true
    @State var isYourCalendar = true
    @State var isWhatFetusIsDoing = true
    @State var isToDo = true
    @State var isYourWeight = true
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                //header
                HStack {
                    Text("Settings")
                        .font(.system(size: 32, weight: .heavy))
                    Spacer()
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
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
                .padding(20)
                List {
                    //general
                    Section {
                        Text("General")
                            .font(.system(size: 24, weight: .heavy))
                            .listRowSeparator(.hidden)
                            .padding(.top, 20)
                        HStack {
                            Text("Subscription")
                            Spacer()
                            Text("Active until 20 March 2024")
                        }
                        Toggle(isOn: $isNotification) {
                            Text("Notification")
                        }
                        NavigationLink {
                            AdditionalView()
                        } label: {
                            Text("Rate app")
                        }
                        NavigationLink {
                            AdditionalView()
                        } label: {
                            Text("Contact support")
                        }
                    }
                    .padding(.horizontal, 20)
                    .listRowBackground(Color.black.opacity(0.5))
                    
                    //account
                    Section{
                        NavigationLink {
                            AdditionalView()
                        } label: {
                            Text("Log out")
                        }
                        NavigationLink {
                            AdditionalView()
                        } label: {
                            Text("Delete account")
                        }
                        NavigationLink {
                            AdditionalView()
                        } label: {
                            Text("Download personal data")
                        }
                    }
                    .padding(.horizontal, 20)
                    .listRowBackground(Color.black.opacity(0.5))
                    
                    //today’s blocks
                    Section {
                        Text("Today’s blocks")
                            .font(.system(size: 24, weight: .heavy))
                            .listRowSeparator(.hidden)
                            .padding(.top, 20)
                        Toggle(isOn: $isYourCalendar) {
                            Text("Your calendar")
                        }
                        Toggle(isOn: $isWhatFetusIsDoing) {
                            Text("What fetus is doing")
                        }
                        Toggle(isOn: $isToDo) {
                            Text("To do")
                        }
                        Toggle(isOn: $isYourWeight) {
                            Text("Your weight")
                        }
                    }
                    .padding(.horizontal, 20)
                    .listRowBackground(Color.black.opacity(0.5))
                }
                .font(.system(size: 14))
                .background(Color("Color8"))
                .scrollContentBackground(.hidden)
                .toggleStyle(CustomToggleStyle())
            }
            .background(Color("Color8"))
            .foregroundColor(.white)
        }
        .accentColor(.white)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
