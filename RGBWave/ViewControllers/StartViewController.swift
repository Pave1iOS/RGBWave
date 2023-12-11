//
//  StartViewController.swift
//  RGBWave
//
//  Created by Pavel Gribachev on 07.12.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func set(color: UIColor)
}

final class StartViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController

        settingsVC?.delegate = self
        settingsVC?.presentView = view.backgroundColor
    }
    
}

// MARK: SettingsViewControllerDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func set(color: UIColor) {
        view.backgroundColor = color
    }
}
