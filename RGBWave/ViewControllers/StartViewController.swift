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
        
        view.backgroundColor = UIColor(
            red: backgraund.red,
            green: backgraund.green,
            blue: backgraund.blue,
            alpha: 1
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController

        settingsVC?.presentView = view.backgroundColor
        settingsVC?.backgraund = backgraund
        
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
