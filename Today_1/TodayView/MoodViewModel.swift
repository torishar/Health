//
//  MoodViewModel.swift
//  Today_1
//
//  Created by Viktoriia Sharukhina on 19.05.2023.
//

import Foundation

class MoodViewModel: ObservableObject {
    @Published var moodBreakdown: [Int] = [21, 51, 73, 21, 83, 100]
    @Published var imageMood: [String] = ["mood1", "mood2", "mood3", "mood4", "mood5", "mood6"]
}
