//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Carlos Garcia Perez on 12/3/24.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var springyView: SpringView!
    @IBOutlet var effectButton: SpringButton!
    @IBOutlet var animation: UILabel!
    @IBOutlet var curve: UILabel!
    @IBOutlet var force: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var delay: UILabel!
    
    private var currentEffect: Effect?
    private var nextEffect: Effect?
    private var buttonTappedCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        effectButton.setTitle("Run", for: .normal)
        springyView.layer.cornerRadius = 10
        effectButton.layer.cornerRadius = 10
        setupNextEffect()
        updateView()
    }
    
    @IBAction func buttonTapped(_ sender: SpringButton) {
        
        springyView.animation = nextEffect?.animation ?? ""
        springyView.curve = nextEffect?.curve ?? ""
        springyView.force = CGFloat(nextEffect?.force ?? 0)
        springyView.duration = CGFloat(nextEffect?.duration ?? 0)
        springyView.delay = nextEffect?.delay ?? 0
        
        
        setupNextEffect()
        springyView.animate()
        buttonTappedCount += 1
        updateView()
    }
    
    private func setupNextEffect() {
        currentEffect = nextEffect
        nextEffect = DataStore.shared.randomEffect()
    }
    
    private func updateView() {
        switch buttonTappedCount {
            case 0:
                animation.text = "Animation: \(nextEffect?.animation ?? "")"
                curve.text = "Curve: \(nextEffect?.curve ?? "")"
                force.text = String(format: "Force: %.2f", nextEffect?.force ?? 0)
                duration.text = String(format: "Duration: %.2f", nextEffect?.duration ?? 0)
                delay.text = String(format: "Delay: %.2f", nextEffect?.delay ?? 0)
                effectButton.setTitle("Run", for: .normal)
            default:
                animation.text = "Animation: \(currentEffect?.animation ?? "")"
                curve.text = "Curve: \(currentEffect?.curve ?? "")"
                force.text = String(format: "Force: %.2f", currentEffect?.force ?? 0)
                duration.text = String(format: "Duration: %.2f", currentEffect?.duration ?? 0)
                delay.text = String(format: "Delay: %.2f", currentEffect?.delay ?? 0)
                effectButton.setTitle(nextEffect?.animation, for: .normal)
        }
    }
}
