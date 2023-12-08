//
//  ViewController.swift
//  RGBWave
//
//  Created by Pavel Gribachev on 17.11.2023.
//


import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var colorView: UIView!

    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: Properties
    var backgraund: ColorRGB!
    weak var delegate: SettingsViewControllerDelegate?
    var presentView: UIColor?
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setColor()
        updateUI()
    }
    
    // MARK: IBAction
    @IBAction func doneButtonPressed() {
        delegate?.setBackgraund(
            colorRed: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat()
        )        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }
    
    // MARK: Private func
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}

extension SettingsViewController {
    private func updateUI() {
        colorView.layer.cornerRadius = 15
        
        redSlider.value = Float(backgraund.red)
        greenSlider.value = Float(backgraund.green)
        blueSlider.value = Float(backgraund.blue)
        colorView.backgroundColor = presentView
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
}


