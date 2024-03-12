//
//  DataStore.swift
//  SpringAnimationApp
//
//  Created by Carlos Garcia Perez on 12/3/24.
//

import SpringAnimation

final class DataStore {
    
    static let shared = DataStore()
    
    private init() {}
    
    func randomEffect() -> Effect {
        let randomAnimation = randomAnimationString()
        let randomCurve = randomCurveString()
        let randomForce = Double.random(in: 1.0...1.7)
        let randomDuration = Double.random(in: 1.0...1.7)
        let randomDelay = 0.3
        
        return Effect(
            animation: randomAnimation,
            curve: randomCurve,
            force: randomForce,
            duration: randomDuration,
            delay: randomDelay
        )
    }
    
    private func randomAnimationString() -> String {
        let animation = AnimationPreset.allCases.map { $0.rawValue }
        return animation.randomElement() ?? "pop"
    }
    
    private func randomCurveString() -> String {
        let curves = AnimationCurve.allCases.map { $0.rawValue }
        return curves.randomElement() ?? "easeInOut"
    }
}
