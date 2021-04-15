//
//  LegalCVCell.swift
//  SettingsTemplate
//
//  Created by James Sedlacek on 4/14/21.
//

import UIKit

class LegalCVCell: UICollectionViewCell {
    var delegate: ViewButtonDelegate?
    @IBOutlet weak var row1View: UIView!
    @IBOutlet weak var row2View: UIView!
    
    func initButtonGesture(_ vcDelegate: ViewButtonDelegate) {
        delegate = vcDelegate
        row1View.isUserInteractionEnabled = true
        row2View.isUserInteractionEnabled = true
        
        let tap1Gesture = UITapGestureRecognizer(target: self, action: #selector(row1Tapped))
        row1View.addGestureRecognizer(tap1Gesture)
        
        let tap2Gesture = UITapGestureRecognizer(target: self, action: #selector(row2Tapped))
        row2View.addGestureRecognizer(tap2Gesture)
    }
    
    @objc func row1Tapped() {
        delegate?.viewButtonTapped(.TermsOfService)
    }
    
    @objc func row2Tapped() {
        delegate?.viewButtonTapped(.PrivacyPolicy)
    }
}
