//
//  AppThemeCVCell.swift
//  SettingsTemplate
//
//  Created by James Sedlacek on 4/13/21.
//

import UIKit

class AppThemeCVCell: UICollectionViewCell {
    @IBOutlet weak var lightButton: UIButton!
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    @IBAction func lightButtonTapped(_ sender: UIButton) {
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func darkButtonTapped(_ sender: UIButton) {
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .dark
        }
    }
}
