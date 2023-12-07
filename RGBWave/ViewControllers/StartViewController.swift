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

    private var backgraund = Backgraund()
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController

        settingsVC?.presentView = view.backgroundColor
        settingsVC?.backgraund = backgraund
        
        settingsVC?.delegate = self
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        let settingsVC = segue.source as? SettingsViewController
        
        backgraund.red = settingsVC?.redSlider.value.cgFloat() ?? 0
        backgraund.green = settingsVC?.greenSlider.value.cgFloat() ?? 0
        backgraund.blue = settingsVC?.blueSlider.value.cgFloat() ?? 0
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
            red: backgraund.red,
            green: backgraund.green,
            blue: backgraund.blue,
            alpha: 1
        )
        
    }
}
