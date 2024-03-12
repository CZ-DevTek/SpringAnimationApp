//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Carlos Garcia Perez on 12/3/24.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    @IBOutlet var springyView: SpringView!
    @IBOutlet var effectButton: SpringButton!
    @IBOutlet var animation: UILabel!
    @IBOutlet var curve: UILabel!
    @IBOutlet var force: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var delay: UILabel!
    
    var currentEffect: Effect?
    var nextEffect: Effect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        effectButton.setTitle("Run", for: .normal)
        springyView.layer.cornerRadius = 10
        effectButton.layer.cornerRadius = 10
        nextEffect = DataStore.shared.randomEffect()
        currentEffect = nextEffect
        /* aqui no entiende cual es el valor de las labels una por una por eso no las carga, y se podria crear una funcion updateLabels que basicamente permitiera llamar aqui y en el bottton a la funcion
        private func updateLabels(with effect: Effect?) {
                if let effect = effect {
                    animation.text = "Animation: \(effect.animation)"
                    curve.text = "Curve: \(effect.curve)"
                    force.text = String(format: "Force: %.2f", effect.force)
                    duration.text = String(format: "Duration: %.2f", effect.duration)
                    delay.text = String(format: "Delay: %.2f", effect.delay)
         */
    }
    
    @IBAction func buttonTapped(_ sender: SpringButton) {
        let nextRandomEffect = DataStore.shared.randomEffect()
        
        
        if let currentEffect = currentEffect {
               animation.text = "Animation: \(currentEffect.animation)"
               curve.text = "Curve: \(currentEffect.curve)"
               force.text = String(format: "Force: %.2f", currentEffect.force)
               duration.text = String(format: "Duration: %.2f", currentEffect.duration)
               delay.text = String(format: "Delay: %.2f", currentEffect.delay)
           }
        
        effectButton.setTitle(nextRandomEffect.animation, for: .normal)
        currentEffect = nextRandomEffect
        
        springyView.animation = nextRandomEffect.animation
        springyView.curve = nextRandomEffect.curve
        springyView.force = CGFloat(nextRandomEffect.force)
        springyView.duration = CGFloat(nextRandomEffect.duration)
        springyView.delay = nextRandomEffect.delay
        
        springyView.animate()
        
    }

}



