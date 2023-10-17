//
//  Source.swift
//  ProgressDemoApp
//
//  Created by Artem on 16.10.2023.
//

import Foundation

struct Source {
    static private let tasks = [
        "Play guitar",
        "Go to the GYM",
        "Play Football"
    ]
    
    static func getTask() -> String? {
        tasks.randomElement()
    }
}
