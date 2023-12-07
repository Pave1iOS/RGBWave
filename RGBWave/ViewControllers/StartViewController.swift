//
//  StartViewController.swift
//  RGBWave
//
//  Created by Pavel Gribachev on 07.12.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setBackgraund(red: CGFloat, green: CGFloat, blue: CGFloat)
}

final class StartViewController: UIViewController {

    weak var delegate: SettingsViewControllerDelegate?
    
    var redColor: CGFloat!
    var greenColor: CGFloat!
    var blueColor: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColor = 0.2
        greenColor = 0.8
        blueColor = 0.5
        
        view.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.redColorSlider = Float(redColor)
        settingsVC?.greenColorSlider = Float(greenColor)
        settingsVC?.blueColorSlider = Float(blueColor)
        settingsVC?.presentView = view.backgroundColor
        
        settingsVC?.delegate = self
    }
    
}

// MARK: SettingsViewControllerDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func setBackgraund(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
}
