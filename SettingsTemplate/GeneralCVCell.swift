//
//  GeneralCVCell.swift
//  SettingsTemplate
//
//  Created by James Sedlacek on 4/14/21.
//

import UIKit

class GeneralCVCell: UICollectionViewCell {
    
    var parentVC: UIViewController?
    var delegate: SetPickerDelegate?
    
    @IBOutlet weak var currencyTF: UITextField!
    
    @IBAction func beginEditing(_ sender: UITextField) {
        delegate?.setPicker(to: .currency)
    }
    
    func setup(_ viewController: SetPickerDelegate) {
        delegate = viewController
        parentVC = viewController as? UIViewController
        createPicker()
        createToolbar()
    }
    
    private func createPicker() {
        guard let vc = parentVC else { return }
        let picker = UIPickerView()
        picker.delegate = vc as? UIPickerViewDelegate
        picker.dataSource = vc as? UIPickerViewDataSource
        currencyTF.inputView = picker
    }
    
    private func createToolbar() {
        let screenSize = UIScreen.main.bounds
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.center = CGPoint(x: screenSize.width/2, y: 200)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        let flexible = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneButtonTapped as () -> Void))
        
        toolbar.setItems([cancelButton, flexible, doneButton], animated: false)
        
        toolbar.isUserInteractionEnabled = true
        currencyTF.inputAccessoryView = toolbar
    }

    @objc func dismissKeyboard() {
        guard let vc = parentVC else { return }
        vc.view.endEditing(true)
    }
    
    @objc func doneButtonTapped() {
        guard let vc = parentVC else { return }
        //TODO: When a user taps the done button
        vc.view.endEditing(true)
    }
}
