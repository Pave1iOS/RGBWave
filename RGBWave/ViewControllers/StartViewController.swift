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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        
        settingsVC?.delegate = self
    }
    
}

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
