//
//  ContactUsCVCell.swift
//  SettingsTemplate
//
//  Created by James Sedlacek on 4/14/21.
//

import UIKit

class ContactUsCVCell: UICollectionViewCell {
    var delegate: ViewButtonDelegate?
    @IBOutlet weak var row1View: UIView!
    
    func initButtonGesture(_ vcDelegate: ViewButtonDelegate) {
        delegate = vcDelegate
        row1View.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rowTapped))
        row1View.addGestureRecognizer(tapGesture)
    }
    
    @objc func rowTapped() {
        delegate?.viewButtonTapped(.ContactUs)
    }
}
