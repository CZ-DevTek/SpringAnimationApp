//
//  Model.swift
//  SpringAnimationApp
//
//  Created by Carlos Garcia Perez on 12/3/24.
//

import Foundation

struct Effect {
    let animation: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double

    static func getDefaultValues() -> Effect {
        Effect(
            animation: "pop",
            curve: "easeInt",
            force: 1,
            duration: 0.7,
            delay: 0
        )
    }
}



