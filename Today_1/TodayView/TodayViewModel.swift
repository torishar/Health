//
//  TodayViewModel.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 17.05.2023.
//

import Foundation

class TodayViewModel: ObservableObject {
    
    func todayDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: Date())
    }
}
