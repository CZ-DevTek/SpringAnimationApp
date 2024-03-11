//
//  Model.swift
//  SpringAnimationApp
//
//  Created by Carlos Garcia Perez on 12/3/24.
//

import Foundation

struct Effect {
    let preset: String
    let curve: String
    let force: String
    let duration: String
    let delay: String
    
    static func getEffects() -> [Effect] {
        let data = DataStore.shared
        var result: [Effect] = []
        
        for effect in data.effects {
            result.append(
                Effect(
                    preset: effect.preset,
                    curve: effect.curve,
                    force: effect.force,
                    duration: effect.duration,
                    delay: effect.delay
                )
            )
        }
        return result
    }
}

