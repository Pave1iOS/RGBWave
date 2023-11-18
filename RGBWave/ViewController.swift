//
//  ViewController.swift
//  RGBWave
//
//  Created by Pavel Gribachev on 17.11.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var presentView: UIView!
    @IBOutlet var progressLabels: [UILabel]!
    @IBOutlet var colorRGBSliders: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizingSliders()
        sliderProgressInLabel()
        
        presentView.layer.cornerRadius = 10
    }
    
    @IBAction func slidersRGBAction() {
        sliderProgressInLabel()
                
        presentView.backgroundColor = UIColor(
            red: CGFloat(colorRGBSliders[0].value),
            green: CGFloat(colorRGBSliders[1].value),
            blue: CGFloat(colorRGBSliders[2].value),
            alpha: 1
        )
    }
    
    private func sliderProgressInLabel() {
        progressLabels[0].text = roundFloat(colorRGBSliders[0].value)
        progressLabels[1].text = roundFloat(colorRGBSliders[1].value)
        progressLabels[2].text = roundFloat(colorRGBSliders[2].value)
    }
    
    private func customizingSliders() {
        colorRGBSliders.forEach { $0.minimumValue = 0 }
        colorRGBSliders.forEach { $0.maximumValue = 1 }
        colorRGBSliders.forEach { $0.value = 0 }
        
        colorRGBSliders[0].minimumTrackTintColor = .systemRed
        colorRGBSliders[1].minimumTrackTintColor = .systemGreen
        colorRGBSliders[2].minimumTrackTintColor = .systemBlue
    }
}

extension ViewController {
    private func roundFloat(_ value: Float) -> String {
        String(format:"%.02f", value)
    }
}
