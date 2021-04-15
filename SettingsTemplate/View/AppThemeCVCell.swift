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
    
    func styleButtons() {
        let margin: CGFloat = 28
        let screenSize = UIScreen.main.bounds
        let cellWidth = screenSize.width - margin
        lightButton.layer.cornerRadius = 8
        darkButton.layer.cornerRadius = 8
        buttonStackView.spacing = (cellWidth -
                                    lightButton.frame.width -
                                    darkButton.frame.width) / 3
    }
}
