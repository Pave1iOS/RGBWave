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

    var backgraund = Backgraund()
    
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController

        settingsVC?.presentView = view.backgroundColor
        settingsVC?.backgraund = backgraund
        
        settingsVC?.delegate = self
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        let settingsVC = segue.source as? SettingsViewController
        
        backgraund.red = settingsVC?.redSlider.value.cgFloat()
        backgraund.green = settingsVC?.greenSlider.value.cgFloat()
        backgraund.blue = settingsVC?.blueSlider.value.cgFloat()
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

extension StartViewController {
    private func updateUI() {
        
        view.backgroundColor = UIColor(
            red: backgraund.red ?? 0,
            green: backgraund.green ?? 0,
            blue: backgraund.blue ?? 0,
            alpha: 1
        )
        
    }
}
