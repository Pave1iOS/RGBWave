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
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
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
        
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
        
        for textField in [redTextField, greenTextField, blueTextField] {
            textField?.delegate = self
        }
        
        for slider in [redSlider, greenSlider, blueSlider] {
            slider?.addTarget(
                self,
                action: #selector(SettingsViewController.valueChanged),
                for: .valueChanged
            )
        }
}
        
    @objc private func valueChanged() {
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    
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

// MARK: UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let floatTF = Float(textField.text!) else { return }
        
        if textField == redTextField {
            redSlider.setValue(floatTF, animated: true)
            redLabel.text = string(from: redSlider)
            setColor()
        } else if textField == greenTextField {
            greenSlider.setValue(floatTF, animated: true)
            greenLabel.text = string(from: greenSlider)
            setColor()
        } else {
            blueSlider.setValue(floatTF, animated: true)
            blueLabel.text = string(from: blueSlider)
            setColor()
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
    }
}

